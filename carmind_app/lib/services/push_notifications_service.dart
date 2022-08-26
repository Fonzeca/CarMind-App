import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStreamController = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    //Por si algún día queremos manejar la data de la notificación y realizar alguna acción
    //_messageStreamController.add(message.data['product'] ?? 'No data');
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    //Por si algún día queremos manejar la data de la notificación y realizar alguna acción
    //_messageStreamController.add(message.data['product'] ?? 'No data');
  }

  static Future<void> _onMessageOpenAppHandler(RemoteMessage message) async {
    //Por si algún día queremos manejar la data de la notificación y realizar alguna acción
    //_messageStreamController.add(message.data['product'] ?? 'No data');
  }

  static Future initializeApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    await _requestPermission();
    token = await FirebaseMessaging.instance.getToken();

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenAppHandler);

    //Local Notifications
  }

  static _requestPermission() async {
    await messaging.requestPermission(
        alert: true, announcement: false, badge: true, carPlay: false, criticalAlert: false, provisional: false, sound: true);
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
