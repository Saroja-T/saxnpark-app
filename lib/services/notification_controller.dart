// import 'dart:async';
// import 'dart:isolate';
// import 'dart:ui';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;


// ///  *********************************************
// ///     NOTIFICATION CONTROLLER
// ///  *********************************************
// ///
// class NotificationController {
//   static ReceivedAction? initialAction;

//   ///  *********************************************
//   ///     INITIALIZATIONS
//   ///  *********************************************
//   ///
//   static Future<void> initializeLocalNotifications() async {
//     await AwesomeNotifications().initialize(
//         null, //'resource://drawable/res_app_icon',//
//         [
//           NotificationChannel(
//               channelKey: 'alerts',
//               channelName: 'Alerts',
//               channelDescription: 'Notification tests as alerts',
//               playSound: true,
//               onlyAlertOnce: true,
//               groupAlertBehavior: GroupAlertBehavior.Children,
//               importance: NotificationImportance.High,
//               defaultPrivacy: NotificationPrivacy.Private,
//               defaultColor: Colors.deepPurple,
//               ledColor: Colors.deepPurple)
//         ],
//         debug: true);

//     // Get initial notification action is optional
//     initialAction = await AwesomeNotifications()
//         .getInitialNotificationAction(removeFromActionEvents: false);
//   }

  

//   ///  *********************************************
//   ///     NOTIFICATION CREATION METHODS
//   ///  *********************************************
//   ///
//   static Future<void> createNewNotification() async {
//     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     // if (!isAllowed) isAllowed = await displayNotificationRationale();
//     if (!isAllowed) return;

//     await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: -1, // -1 is replaced by a random number
//             channelKey: 'alerts',
//             title: 'Huston! The eagle has landed!',
//             body:
//                 "A small step for a man, but a giant leap to Flutter's community!",
//             bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
//             largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
//             //'asset://assets/images/balloons-in-sky.jpg',
//             notificationLayout: NotificationLayout.BigPicture,
//             payload: {'notificationId': '1234567890'}),
//         actionButtons: [
//           NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
//           NotificationActionButton(
//               key: 'REPLY',
//               label: 'Reply Message',
//               requireInputText: true,
//               actionType: ActionType.SilentAction),
//           NotificationActionButton(
//               key: 'DISMISS',
//               label: 'Dismiss',
//               actionType: ActionType.DismissAction,
//               isDangerousOption: true)
//         ]);
//   }

  

// Future<void> myNotifyScheduleInHours({
//   required int hoursFromNow,
//   required String heroThumbUrl,
//   required String username,
//   required String title,
//   required String msg,
//   bool repeatNotif = false,
// }) async {
//   var nowDate = DateTime.now().add(Duration(hours: hoursFromNow, seconds: 5));
//   await AwesomeNotifications().createNotification(
//     schedule: NotificationCalendar(
//       //weekday: nowDate.day,
//       hour: nowDate.hour,
//       minute: 0,
//       second: nowDate.second,
//       repeats: repeatNotif,
//       //allowWhileIdle: true,
//     ),
//     // schedule: NotificationCalendar.fromDate(
//     //    date: DateTime.now().add(const Duration(seconds: 10))),
//     content: NotificationContent(
//       id: -1,
//       channelKey: 'basic_channel',
//       title: '${Emojis.food_bowl_with_spoon} $title',
//       body: '$username, $msg',
//       bigPicture: heroThumbUrl,
//       notificationLayout: NotificationLayout.BigPicture,
//       //actionType : ActionType.DismissAction,
//       color: Colors.black,
//       backgroundColor: Colors.black,
//       // customSound: 'resource://raw/notif',
//       payload: {'actPag': 'myAct', 'actType': 'food', 'username': username},
//     ),
//     actionButtons: [
//       NotificationActionButton(
//         key: 'NOW',
//         label: 'btnAct1',
//       ),
//       NotificationActionButton(
//         key: 'LATER',
//         label: 'btnAct2',
//       ),
//     ],
//   );
// }
// }
