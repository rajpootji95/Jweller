
import 'package:demo_app/Routes/all_pages.dart';
import 'package:demo_app/Routes/routes.dart';
import 'package:demo_app/Routes/screen_bindings.dart';
import 'package:demo_app/Screens/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// Future<void> backgroundHandler(RemoteMessage message) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   print(message.data.toString());
//   print(message.notification!.title);
// }
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyCpUxegzsqLlTQnc9vf-nyFDn8f0GR8PRU",
  //     appId: "1:918421044029:android:415acff400d143e8c6a354",
  //     messagingSenderId: "918421044029",
  //     projectId: "jweller-ad4a8",
  //   )
  // );
  runApp(const MyApp());

}
@pragma("vm:entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp();
  debugPrint(message.notification!.title.toString());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen,
      getPages: AllPages.getPages(),
      initialBinding: ScreenBindings(),
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}