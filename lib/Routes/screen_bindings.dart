
import 'package:demo_app/Screens/Auth_Views/Login/login_controller.dart';
import 'package:demo_app/Screens/Auth_Views/Signup/signup_controller.dart';
import 'package:demo_app/Screens/Home/DashBoard/dashboard_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../Screens/Splash/splash_controller.dart';

class ScreenBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => DashBoardController());
  }
}