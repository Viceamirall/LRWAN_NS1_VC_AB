import base64
import csv
import json
from pathlib import Path
import tempfile
import unittest
from chirpstack_mqtt_over_ws import decode_payload, decode_uplink, Evidence

FRAME = bytes.fromhex('01 99 05 56 43 5F 41 42 02 73 02 27 94 03 67 02 00 EA 04 68 01 73 05 00 01 64')
TOPIC = 'application/1/device/8cf957200000f8a9/event/up'

class DecoderTests(unittest.TestCase):
    def test_part8_units_and_signed_temperature(self):
        values = decode_payload(FRAME)
        self.assertEqual(values, {'group':'VC_AB','pressure_dapa':10132,
            'pressure_hpa':1013.2,'temperature_c':23.4,'humidity_percent':57.5,
            'battery_percent':100})
        cold = bytearray(FRAME)
        cold[16:18] = bytes.fromhex('FF C9')
        self.assertEqual(decode_payload(cold)['temperature_c'], -5.5)

    def test_part5_three_blocks(self):
        values = decode_payload(bytes.fromhex('01990556435F414202670200EA03000164'))
        self.assertEqual(values, {'group':'VC_AB','temperature_c':23.4,'battery_percent':100})

    def test_truncated_frames_and_wrong_sizes(self):
        cases = [b'', FRAME[:1], FRAME[:-1], FRAME[:10] + b'\x01' + FRAME[11:]]
        for frame in cases:
            with self.subTest(frame=frame), self.assertRaises(ValueError):
                decode_payload(frame)

    def test_duplicate_type_and_channels(self):
        for frame in [FRAME + bytes.fromhex('06000132'), FRAME[:8] + b'\x01' + FRAME[9:]]:
            with self.subTest(frame=frame), self.assertRaises(ValueError):
                decode_payload(frame)

    def test_out_of_range_battery_and_humidity(self):
        for pos, value in [(21,201),(25,101)]:
            frame=bytearray(FRAME)
            frame[pos]=value
            with self.assertRaises(ValueError):decode_payload(frame)

    def test_v3_v4_and_topic_identity(self):
        variants=[{'devEUI':'8C:F9:57:20:00:00:F8:A9'},
                  {'deviceInfo':{'devEui':'8cf957200000f8a9'}}, {}]
        for identity in variants:
            event={**identity,'fCnt':42,'data':base64.b64encode(FRAME).decode()}
            sample=decode_uplink(TOPIC,json.dumps(event))
            self.assertEqual(sample['group'],'VC_AB')
            self.assertEqual(sample['f_cnt'],42)
            self.assertEqual(sample['event'],event)

    def test_filters_other_boards_and_groups(self):
        event={'deviceInfo':{'devEui':'0000000000000001'}, 'data':'not base64'}
        self.assertIsNone(decode_uplink(TOPIC,json.dumps(event)))
        event={'data':base64.b64encode(FRAME.replace(b'VC_AB',b'XX_YY')).decode()}
        self.assertIsNone(decode_uplink(TOPIC,json.dumps(event)))

    def test_invalid_json_and_base64(self):
        for message in ['{', '[]', json.dumps({'data':'!?'}), json.dumps({'data':None})]:
            with self.subTest(message=message), self.assertRaises(ValueError):
                decode_uplink(TOPIC,message)

    def test_capture_preserves_raw_cloud_event_and_decoded_csv(self):
        event={'deviceInfo':{'devEui':'8cf957200000f8a9'},'fCnt':7,
               'data':base64.b64encode(FRAME).decode()}
        sample=decode_uplink(TOPIC,json.dumps(event))
        with tempfile.TemporaryDirectory() as folder:
            path=Path(folder)
            evidence=Evidence(path)
            evidence.save(sample)
            evidence.close()
            self.assertEqual(json.loads((path/'uplinks.jsonl').read_text())['event'],event)
            with (path/'mesures.csv').open() as f:rows=list(csv.DictReader(f))
            self.assertEqual(rows[0]['humidity_percent'],'57.5')
            self.assertEqual(rows[0]['pressure_hpa'],'1013.2')


class PlotTests(unittest.TestCase):
    def test_four_curves_and_replay_timestamps(self):
        from chirpstack_mqtt_over_ws import Plot
        import importlib.util
        if importlib.util.find_spec('matplotlib') is None:
            self.skipTest('Matplotlib absent de cet interpréteur')
        with tempfile.TemporaryDirectory() as folder:
            plot=Plot(Path(folder),'TEST HORS CONNEXION',headless=True)
            try:
                for second, temp in [(0,23.4),(15,23.6),(30,23.8)]:
                    plot.update({'group':'TEST HORS CONNEXION','dev_eui':'SIMULATION',
                        'f_cnt':second//15, 'received_at':f'2026-10-05T12:00:{second:02d}+00:00',
                        'temperature_c':temp,'pressure_hpa':1013.2,
                        'humidity_percent':57.5,'battery_percent':100})
                self.assertEqual(list(plot.times),[0,15,30])
                self.assertEqual(len(plot.axes),4)
                self.assertEqual(list(plot.values['temperature_c']),[23.4,23.6,23.8])
                self.assertGreater((Path(folder)/'courbes.png').stat().st_size,10000)
            finally:plot.close()

class MqttTests(unittest.TestCase):
    def test_websocket_setup_subscription_and_receive_queue(self):
        from chirpstack_mqtt_over_ws import make_client
        from queue import Queue
        from types import SimpleNamespace
        from unittest.mock import patch
        import paho.mqtt.client as mqtt
        if not hasattr(mqtt,'CallbackAPIVersion'):
            self.skipTest('paho-mqtt 2 requis')
        args=SimpleNamespace(url='wss://example.invalid:8443/ws/mqtt?app=abc',topic=TOPIC)
        inbox=Queue()
        with patch('paho.mqtt.client.Client') as constructor:
            client=make_client(args,inbox)
            client.ws_set_options.assert_called_once_with(path='/ws/mqtt?app=abc')
            client.tls_set.assert_called_once()
            client.connect.assert_called_once_with('example.invalid',8443)
            client.on_connect(client,None,{},0,None)
            client.subscribe.assert_called_once_with(TOPIC)
            client.on_message(client,None,SimpleNamespace(topic=TOPIC,payload=b'{"data":"test"}'))
            self.assertEqual(inbox.get_nowait(),(TOPIC,b'{"data":"test"}',None))

if __name__ == '__main__':unittest.main()
