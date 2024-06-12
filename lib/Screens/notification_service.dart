//
//
// import 'dart:math';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
// // FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// class LocalNotificationService {
//   /* static final FlutterLocalNotificationsPlugin
//   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();*/
//
//    void initialize() async {
//     NotificationSettings settings =
//     await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//    if( settings.authorizationStatus == AuthorizationStatus.denied){
//      Fluttertoast.showToast(msg: "PLease provide notification permission");
//       return;
//     }
//    else if (settings.authorizationStatus == AuthorizationStatus.provisional){
//      const InitializationSettings initializationSettings =
//      InitializationSettings(
//          android: AndroidInitializationSettings(
//              "@mipmap/ic_launcher"),
//          //DrawInitializationSettings
//          iOS: DarwinInitializationSettings());
//      flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//      await FirebaseMessaging.instance
//          .setForegroundNotificationPresentationOptions(
//        alert: true, // Required to display a heads up notification
//        badge: true,
//        sound: true,
//      );
//
//      const AndroidNotificationChannel channel = AndroidNotificationChannel(
//        'high_importance_channel', // id
//        'High Importance Notifications', // title
//        description: 'This channel is used for important notifications.', // description
//        importance: Importance.max,sound: RawResourceAndroidNotificationSound('test'),playSound: true,showBadge: true,
//      );
//      await flutterLocalNotificationsPlugin
//          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//          ?.createNotificationChannel(channel);
//
//      FirebaseMessaging.instance.getInitialMessage().then(
//            (message) {
//          print("FirebaseMessaging.instance.getInitialMessage");
//          print("FirebaseMessagingfdfsfsfsfsf   ${message?.data.length}");
//          if (message != null) {
//            print("New Notification");
//            // if (message.data['_id'] != null) {
//            //   Navigator.of(context).push(
//            //     MaterialPageRoute(
//            //       builder: (context) => DemoScreen(
//            //         id: message.data['_id'],
//            //       ),
//            //     ),
//            //   );
//            // }.
//            display(message);
//          }
//        },
//      );
//
//      FirebaseMessaging.onMessage.listen(
//            (message) {
//          print("FirebaseMessaging.onMessage.listen");
//          if (message.notification != null) {
//            print(message.notification!.title);
//            print(message.notification!.body);
//            print("message.data11 ${message.data['channel_id']}");
//
//            if(message.data['channel_id']!=null && message.data['call_id']!= null) {
//
//
//            }
//
//
//            display(message);
//          }
//        },
//      );
//
//      FirebaseMessaging.onMessageOpenedApp.listen(
//            (message) {
//          print("FirebaseMessaging.onMessageOpenedApp.listen");
//          if (message.notification != null) {
//            print(message.notification!.body);
//            print(message.notification!.body);
//
//            if(message.data['channel_id']!=null && message.data['call_id']!= null) {
//
//
//
//
//            }
//          }
//        },
//      );
//    }
//
//   }
//
//   Future<String?>getToken() async {
//      String? token = await FirebaseMessaging.instance.getToken();
//      return token;
//   }
//
//   static void display(RemoteMessage message) async {
//     try {
//       print("In Notification method");
//       // int id = DateTime.now().microsecondsSinceEpoch ~/1000000;
//       Random random = Random();
//       int id = random.nextInt(1000);
//       const NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails(
//             "default_notification_channel",
//             "jewellery_channel",
//             importance: Importance.max,
//             priority: Priority.high,
//             playSound:true,
//             // icon: 'ic_launcher',
//             sound: RawResourceAndroidNotificationSound('test'),
//           ));
//       print("my id is ${id.toString()}");
//
//       await flutterLocalNotificationsPlugin.show(
//           id,
//           message.notification!.title,
//           message.notification!.body,
//           notificationDetails,
//           payload: message.data['_id']);
//     } on Exception catch (e) {
//       print('Error>>>$e');
//     }
//   }
//
// }
//
//

import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class LocalNotificationService {
  BuildContext? context;
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() async {
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings(
          "@mipmap/ic_launcher"),
      //iOS: DarwinInitializationSettings()
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    NotificationSettings settings =
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");

        }
      },
    );

    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage______________");
        if (message.notification != null) {
          print('${message.notification}_________________');
          print('${message.notification!.body}_________body____');
          print("message.data11 ${message.data}");

          display(message);

          //handleNotification(message.data);

        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp___________");
        if (message.notification != null) {
          print('_____________${message.notification}_______________');
          print('_____________${message.notification?.title}_______________');
          print(message.notification!.body);
          print("message.data22 ${message.data}");


          //handleNotification(message.data);

          // HomeScreenState().setSegmentValue(2) ;




        }
      },
    );


  }
  static  Future<void> handleNotification(Map<String, dynamic> message) async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      // App was opened from a notification
      // TODO: handle the notification

    } else {
      // App was opened normally
    }
  }


  static void display(RemoteMessage message) async {
    try {
      print("In Notification method");
      Random random = Random();
      int id = random.nextInt(1000);
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "Jeweller",
            "Jeweller",
            importance: Importance.max,
            priority: Priority.high,
          ));
      //print("my id is ${id.toString()}");
      await _flutterLocalNotificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: message.data['_id']);
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }



}
