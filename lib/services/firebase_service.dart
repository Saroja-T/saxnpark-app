

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService{
  final _firebaseMessaging = FirebaseMessaging.instance;
  late final fcmToken;

  initNotifications()
  {
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((value) {
      fcmToken = value;
    print("FCM Token $value");

    });
  }
}