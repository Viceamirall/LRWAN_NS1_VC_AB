#!/usr/bin/env python3
"""Client MQTT/WebSocket du TP : réception, décodage et courbes Matplotlib."""

import argparse
import base64
import binascii
from collections import deque
import csv
from datetime import datetime, timezone
import json
import os
from pathlib import Path
from queue import Empty, Queue
import time
from urllib.parse import urlsplit


DEFAULT_URL = "ws://chirpstack.alora-one.com:9001/mqtt"
DEFAULT_APPLICATION = "48837f27-1518-45c8-b18f-96dedc28c543"
DEFAULT_DEVICE = "8cf957200000f8a9"
DEFAULT_GROUP = "VC_AB"


def normalize_device(value):
    return str(value).replace(":", "").replace("-", "").lower()


def decode_payload(payload):
    """Décode les blocs numéro/type/taille/données des parties 5 et 8."""
    result = {}
    sizes = {0x73: 2, 0x67: 2, 0x68: 1, 0x00: 1}
    seen = set()
    offset = 0
    previous_channel = 0
    while offset < len(payload):
        if len(payload) - offset < 3:
            raise ValueError("En-tête de bloc incomplet")
        channel, kind, size = payload[offset:offset + 3]
        offset += 3
        if channel <= previous_channel:
            raise ValueError("Les numéros de bloc doivent être croissants")
        previous_channel = channel
        if kind in seen:
            raise ValueError(f"Type de bloc dupliqué : 0x{kind:02X}")
        seen.add(kind)
        if len(payload) - offset < size:
            raise ValueError("Données de bloc tronquées")
        data = payload[offset:offset + size]
        offset += size
        if kind == 0x99:
            if not data:
                raise ValueError("Identifiant de groupe vide")
            try:
                result["group"] = data.decode("ascii")
            except UnicodeDecodeError as exc:
                raise ValueError("Identifiant de groupe non ASCII") from exc
        else:
            if kind not in sizes:
                raise ValueError(f"Type de bloc inconnu : 0x{kind:02X}")
            if size != sizes[kind]:
                raise ValueError(f"Taille incorrecte pour le type 0x{kind:02X}")
            number = int.from_bytes(data, "big", signed=(kind == 0x67))
            if kind == 0x73:
                result["pressure_dapa"] = number
                result["pressure_hpa"] = number / 10.0
            elif kind == 0x67:
                result["temperature_c"] = number / 10.0
            elif kind == 0x68:
                if number > 200:
                    raise ValueError("Humidité supérieure à 100 %")
                result["humidity_percent"] = number / 2.0
            elif kind == 0x00:
                if number > 100:
                    raise ValueError("Batterie supérieure à 100 %")
                result["battery_percent"] = number
    required = {"group", "temperature_c", "battery_percent"}
    if not required.issubset(result):
        raise ValueError("Trame incomplète : groupe, température ou batterie absent")
    return result


def decode_uplink(topic, raw_message, device=DEFAULT_DEVICE, group=DEFAULT_GROUP):
    """Accepte les événements JSON ChirpStack v3 et v4 de la carte choisie."""
    try:
        event = json.loads(raw_message)
    except (ValueError, UnicodeDecodeError) as exc:
        raise ValueError("Message MQTT non JSON") from exc
    if not isinstance(event, dict):
        raise ValueError("L'événement doit être un objet JSON")
    info = event.get("deviceInfo") or {}
    if not isinstance(info, dict):
        raise ValueError("Champ deviceInfo incorrect")
    eui = (info.get("devEui") or info.get("devEUI")
           or event.get("devEui") or event.get("devEUI"))
    if not eui:
        parts = topic.split("/")
        try:
            eui = parts[parts.index("device") + 1]
        except (ValueError, IndexError) as exc:
            raise ValueError("DevEUI absent de l'événement et du topic") from exc
    eui = normalize_device(eui)
    if device and eui != normalize_device(device):
        return None
    encoded = event.get("data")
    if not isinstance(encoded, str):
        raise ValueError("Champ data base64 absent ou incorrect")
    try:
        payload = base64.b64decode(encoded, validate=True)
    except (ValueError, binascii.Error) as exc:
        raise ValueError("Payload base64 incorrect") from exc
    values = decode_payload(payload)
    if group and values["group"] != group:
        return None
    return {"event": event, "topic": topic, "dev_eui": eui,
            "received_at": datetime.now(timezone.utc).isoformat(),
            "hex": payload.hex(" ").upper(), "base64": encoded,
            "f_cnt": event.get("fCnt"), **values}


class Evidence:
    """Conserve les événements cloud originaux et les valeurs décodées."""

    columns = ["received_at", "dev_eui", "group", "f_cnt", "temperature_c",
               "pressure_dapa", "pressure_hpa", "humidity_percent",
               "battery_percent", "hex"]

    def __init__(self, directory):
        directory.mkdir(parents=True, exist_ok=True)
        self.events = (directory / "uplinks.jsonl").open("a", encoding="utf-8")
        csv_path = directory / "mesures.csv"
        needs_header = not csv_path.exists() or csv_path.stat().st_size == 0
        self.csv_file = csv_path.open("a", newline="", encoding="utf-8")
        self.writer = csv.DictWriter(self.csv_file, self.columns, extrasaction="ignore")
        if needs_header:
            self.writer.writeheader()

    def save(self, sample):
        self.events.write(json.dumps({"topic": sample["topic"],
                                      "received_at": sample["received_at"],
                                      "event": sample["event"]}, ensure_ascii=False) + "\n")
        self.events.flush()
        self.writer.writerow(sample)
        self.csv_file.flush()

    def close(self):
        self.events.close()
        self.csv_file.close()


class Plot:
    """Les graphes sont manipulés dans le thread principal, hors callbacks MQTT."""

    fields = [("temperature_c", "Température (°C)", "tab:red"),
              ("pressure_hpa", "Pression (hPa)", "tab:blue"),
              ("humidity_percent", "Humidité (%)", "tab:green"),
              ("battery_percent", "Batterie (%)", "tab:orange")]

    def __init__(self, directory, group, headless=False, history=300):
        import matplotlib
        if headless:
            matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        self.plt = plt
        self.headless = headless
        self.directory = directory
        self.started = None
        self.times = deque(maxlen=history)
        self.values = {key: deque(maxlen=history) for key, _, _ in self.fields}
        self.figure, axes = plt.subplots(2, 2, figsize=(11, 7), layout="constrained")
        self.axes = list(axes.flat)
        self.lines = {}
        self.figure.suptitle(f"Mesures reçues depuis ChirpStack — {group}")
        for axis, (key, label, color) in zip(self.axes, self.fields):
            self.lines[key], = axis.plot([], [], "o-", color=color, markersize=4)
            axis.set_ylabel(label)
            axis.set_xlabel("Temps depuis le début de la réception (s)")
            axis.grid(True, alpha=0.3)
        if not headless:
            plt.show(block=False)

    def update(self, sample):
        received = datetime.fromisoformat(sample["received_at"])
        if self.started is None:
            self.started = received
        self.times.append((received - self.started).total_seconds())
        for axis, (key, _, _) in zip(self.axes, self.fields):
            self.values[key].append(sample.get(key, float("nan")))
            self.lines[key].set_data(list(self.times), list(self.values[key]))
            axis.relim()
            axis.autoscale_view()
        self.figure.suptitle(f"ChirpStack — {sample['group']} — "
                             f"DevEUI {sample['dev_eui']} — FCnt {sample['f_cnt']}")
        self.figure.savefig(self.directory / "courbes.png", dpi=150)
        self.figure.canvas.draw_idle()

    def is_open(self):
        return self.headless or self.plt.fignum_exists(self.figure.number)

    def poll(self):
        if not self.headless:
            self.plt.pause(0.1)

    def close(self):
        self.plt.close(self.figure)


def display_sample(sample):
    print(f"\n[{sample['received_at']}] Topic : {sample['topic']}", flush=True)
    print("Message cloud brut :", json.dumps(sample["event"], ensure_ascii=False))
    print("Payload base64 :", sample["base64"])
    print("Payload brut hex :", sample["hex"])
    print(f"Groupe : {sample['group']} | DevEUI : {sample['dev_eui']} | FCnt : {sample['f_cnt']}")
    print(f"Température : {sample['temperature_c']:.2f} °C")
    if "pressure_hpa" in sample:
        print(f"Pression : {sample['pressure_hpa']:.2f} hPa ({sample['pressure_dapa']} daPa)")
    if "humidity_percent" in sample:
        print(f"Humidité : {sample['humidity_percent']:.2f} %")
    print(f"Batterie : {sample['battery_percent']} %", flush=True)


def make_client(args, inbox):
    import paho.mqtt.client as mqtt
    parsed = urlsplit(args.url)
    if parsed.scheme not in ("ws", "wss") or not parsed.hostname:
        raise ValueError("L'adresse doit commencer par ws:// ou wss:// et contenir un hôte")
    if not hasattr(mqtt, "CallbackAPIVersion"):
        raise RuntimeError("paho-mqtt >= 2 requis ; utiliser l'environnement .venv du projet")
    client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2, transport="websockets")
    path = parsed.path or "/mqtt"
    if parsed.query:
        path += "?" + parsed.query
    client.ws_set_options(path=path)
    if parsed.scheme == "wss":
        client.tls_set()
    username = os.environ.get("MQTT_USERNAME")
    if username:
        client.username_pw_set(username, os.environ.get("MQTT_PASSWORD"))

    def on_connect(client, userdata, flags, reason_code, properties):
        if reason_code != 0:
            print(f"Connexion MQTT refusée : {reason_code}", flush=True)
            return
        print(f"Connexion MQTT/WebSocket établie. Abonnement : {args.topic}", flush=True)
        client.subscribe(args.topic)

    def on_subscribe(client, userdata, mid, reason_codes, properties):
        if any(code.is_failure for code in reason_codes):
            print(f"Abonnement refusé : {reason_codes}", flush=True)
        else:
            print("Abonnement confirmé ; attente d'une trame de la carte.", flush=True)

    def on_message(client, userdata, message):
        inbox.put((message.topic, bytes(message.payload), None))

    def on_disconnect(client, userdata, flags, reason_code, properties):
        if reason_code != 0:
            print(f"Connexion interrompue : {reason_code} ; reconnexion automatique.", flush=True)

    client.on_connect = on_connect
    client.on_subscribe = on_subscribe
    client.on_message = on_message
    client.on_disconnect = on_disconnect
    client.connect_timeout = 10
    client.reconnect_delay_set(min_delay=1, max_delay=15)
    port = parsed.port or (443 if parsed.scheme == "wss" else 80)
    print(f"Connexion au broker {parsed.hostname}:{port}, chemin {parsed.path or '/mqtt'}…", flush=True)
    client.connect(parsed.hostname, port)
    return client


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--url", default=DEFAULT_URL, help="Adresse MQTT/WebSocket fournie par l'enseignant")
    parser.add_argument("--application", default=DEFAULT_APPLICATION, help="Identifiant de l’application ChirpStack")
    parser.add_argument("--device", default=DEFAULT_DEVICE, help="DevEUI à recevoir")
    parser.add_argument("--group", default=DEFAULT_GROUP, help="Identifiant du groupe")
    parser.add_argument("--topic", help="Topic MQTT ; par défaut, les uplinks de cette carte")
    parser.add_argument("--output-dir", type=Path, default=Path("captures_question7"))
    parser.add_argument("--no-plot", action="store_true", help="Affichage terminal seulement")
    parser.add_argument("--headless", action="store_true", help="Courbes PNG sans fenêtre graphique")
    parser.add_argument("--duration", type=float, default=0, help="Durée maximale en secondes, 0 = illimitée")
    parser.add_argument("--max-messages", type=int, default=0, help="Nombre maximal de trames, 0 = illimité")
    parser.add_argument("--decode-hex", help="Décoder une trame hexadécimale hors connexion")
    parser.add_argument("--replay", type=Path, help="Relire un fichier uplinks.jsonl sans connexion réseau")
    args = parser.parse_args(argv)
    if args.duration < 0 or args.max_messages < 0:
        parser.error("La durée et le nombre de messages doivent être positifs ou nuls")
    if args.decode_hex:
        try:
            print(json.dumps(decode_payload(bytes.fromhex(args.decode_hex)), ensure_ascii=False, indent=2))
        except ValueError as exc:
            parser.error(str(exc))
        return 0
    args.device = normalize_device(args.device)
    args.topic = args.topic or f"application/{args.application}/device/{args.device}/event/up"
    if args.replay:
        # Charger avant toute écriture et séparer la relecture des captures originales.
        try:
            replay_lines = args.replay.read_text(encoding="utf-8").splitlines()
        except OSError as exc:
            parser.error(str(exc))
        args.output_dir = args.output_dir / "relecture"
        print("Relecture de captures enregistrées ; aucune connexion réseau.", flush=True)
    inbox = Queue()
    evidence = None
    plot = None
    client = None
    count = 0
    started = time.monotonic()
    try:
        evidence = Evidence(args.output_dir)
        if not args.no_plot:
            plot = Plot(args.output_dir, args.group, headless=args.headless)
        if args.replay:
            for line in replay_lines:
                record = json.loads(line)
                inbox.put((record["topic"], json.dumps(record["event"]), record.get("received_at")))
        else:
            client = make_client(args, inbox)
            client.loop_start()
        while (not args.duration or time.monotonic() - started < args.duration):
            if plot and not plot.is_open():
                break
            try:
                topic, raw, received_at = inbox.get(timeout=0.1)
            except Empty:
                if args.replay:
                    break
                if plot:
                    plot.poll()
                continue
            try:
                sample = decode_uplink(topic, raw, args.device, args.group)
            except ValueError as exc:
                print(f"Trame ignorée ({topic}) : {exc}", flush=True)
                continue
            if sample is None:
                continue
            if received_at:
                try:
                    datetime.fromisoformat(received_at)
                except (ValueError, TypeError):
                    print("Capture ignorée : date de réception incorrecte.", flush=True)
                    continue
                sample["received_at"] = received_at
            display_sample(sample)
            evidence.save(sample)
            count += 1
            if plot:
                plot.update(sample)
                plot.poll()
            if args.max_messages and count >= args.max_messages:
                break
    except KeyboardInterrupt:
        print("\nArrêt demandé.", flush=True)
    except (OSError, RuntimeError, ImportError, ValueError) as exc:
        print(f"Erreur : {exc}", flush=True)
        return 1
    finally:
        if client:
            client.disconnect()
            client.loop_stop()
        if plot:
            plot.close()
        if evidence:
            evidence.close()
    print(f"{count} trame(s) décodée(s). Fichiers : {args.output_dir}", flush=True)
    if not count:
        print("Aucune réception validée. Vérifier l'adresse, le topic, le DevEUI et la connexion LoRa.")
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
