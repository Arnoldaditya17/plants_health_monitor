import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:plant_health_monitor/core/routes/routes_name.dart';
import 'package:plant_health_monitor/main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title:${message.notification?.title}');

  print('Body:${message.notification?.body}');

  print('Payload:${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print('Token:$FCMToken');
    initPushNotification();
  }

  void handleMessage(RemoteMessage? message) {
    print(
        "8888888888888888888888888888888--------------------------999999999999999999999999999${message?.notification?.body}");

    if (message == null) {
      return;
    }
    navigatorKey.currentState?.pushNamed(
      RoutesName.notification,
      arguments: message,
    );
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
