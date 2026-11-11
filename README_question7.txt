PARTIE 7 — Client ChirpStack MQTT sur WebSocket

Le client utilise l'adresse du fichier fourni :
  ws://chirpstack.alora-one.com:9001/mqtt
Carte 6 : application 48837f27-1518-45c8-b18f-96dedc28c543, DevEUI 8cf957200000f8a9, groupe VC_AB.
Topic MQTT : application/48837f27-1518-45c8-b18f-96dedc28c543/device/8cf957200000f8a9/event/up
Le protocole applicatif est MQTT sur WebSocket ; websocket-client seul ne remplace pas paho-mqtt.

Depuis le dossier LRWAN_NS1 :
  .venv/bin/python chirpstack_mqtt_over_ws.py

Le terminal affiche le JSON cloud original, le payload base64 et hexadécimal,
le groupe, le compteur de trame, la température, la pression, l'humidité et la batterie.
Les courbes Matplotlib sont actualisées dans le thread principal.
Fermer la fenêtre ou utiliser Ctrl+C pour terminer.

Fichiers enregistrés dans captures_question7/ :
  uplinks.jsonl : événements cloud originaux, topic et date de réception locale
  mesures.csv : valeurs décodées, compteur et payload hexadécimal
  courbes.png : courbes actualisées à chaque trame reçue

Une première mesure produit un point. Plusieurs uplinks sont nécessaires pour obtenir des courbes.
Le client ne publie aucun message MQTT. Il s'abonne au topic de la carte.

Si l'adresse donnée par l'enseignant diffère :
  .venv/bin/python chirpstack_mqtt_over_ws.py --url ws://HOTE:PORT/mqtt
Autres paramètres : --application, --device, --group, --topic, --output-dir.
Si le broker exige des identifiants, le client lit MQTT_USERNAME et MQTT_PASSWORD dans l'environnement.

Validation bornée, PNG sans fenêtre :
  .venv/bin/python chirpstack_mqtt_over_ws.py --headless --duration 55 --max-messages 3
Terminal seulement : ajouter --no-plot.

Décodage hors connexion (aucune preuve de réception cloud) :
  .venv/bin/python chirpstack_mqtt_over_ws.py --decode-hex "01990556435F4142027302279403670200EA0468017305000164"

Relecture des captures sauvegardées :
  .venv/bin/python chirpstack_mqtt_over_ws.py --replay captures_question7/uplinks.jsonl --headless
La relecture produit ses fichiers dans captures_question7/relecture/ et n'établit pas de connexion réseau.

Formats acceptés :
  Chaque bloc : numéro (1 octet), type (1), taille (1), données.
  Groupe 0x99 : ASCII, sans caractère nul.
  Pression 0x73 : entier non signé Big Endian / 10 -> hPa (valeur encodée en daPa).
  Température 0x67 : entier signé Big Endian / 10 -> degrés Celsius.
  Humidité 0x68 : entier non signé / 2 -> pourcentage.
  Batterie 0x00 : entier non signé -> pourcentage.
  La partie 5 (3 blocs) et la partie 8 (5 blocs) sont toutes deux acceptées.

Installation si nécessaire :
  python3 -m venv .venv
  .venv/bin/python -m pip install "paho-mqtt>=2.0,<3" "matplotlib>=3.9,<4"

Documentation officielle utilisée :
  https://eclipse.dev/paho/files/paho.mqtt.python/html/client.html
  https://www.chirpstack.io/docs/chirpstack/integrations/events.html
  https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.pause.html


PROJET STM32 ET RENDU GITHUB

Le dépôt contient les sources de l'application et les dépendances STM32 utilisées
sous firmware/. Les fichiers .project et .cproject pointent vers ces copies locales.
Le dépôt peut être importé indépendamment de l'emplacement du pack I-CUBE-LRWAN.
Les fichiers liés sont affichés dans Application/, Drivers/ et Utilities/ dans CubeIDE.
Le dossier physique firmware/ est exclu de la recherche de sources pour éviter
de compiler deux fois les mêmes fichiers. Les en-têtes y restent accessibles.

Compilation du firmware :
  1. Cloner le dépôt.
  2. Dans STM32CubeIDE : File > Import > Existing Projects into Workspace.
  3. Sélectionner le répertoire contenant .project et importer LRWAN_NS1.
  4. Choisir la configuration Debug puis Project > Build Project.
Les répertoires Debug/ et Release/ sont générés automatiquement par l'IDE.
La configuration de débogage peut être créée localement dans CubeIDE.

Fichiers conservés pour le rendu :
  firmware/ : sources C, assembleur, en-têtes et licences nécessaires
  .project, .cproject, STM32L073RZTx_FLASH.ld : configuration du projet
  chirpstack_mqtt_over_ws.py : réception, décodage et graphes de la partie 7
  captures_question7/mesures.csv : mesures réellement reçues et décodées
  captures_question7/courbes.png : graphe correspondant aux mesures
  captures_question7/uplinks.jsonl : messages cloud bruts pour la partie 7
  README_question7.txt : instructions de compilation et d'utilisation

Les fichiers de compilation, l'environnement .venv/, les caches, la configuration
locale de débogage et l'énoncé TP2IoT.pdf restent sur le disque et sont ignorés par Git.
Les mesures, les messages cloud bruts et le graphe de captures_question7/ sont
inclus dans le dépôt pour le professeur. Les sous-dossiers de relecture restent ignorés.
