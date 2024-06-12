
import 'package:demo_app/Models/login_response_model.dart';
import 'package:demo_app/Routes/routes.dart';
import 'package:demo_app/Routes/screen_bindings.dart';
import 'package:demo_app/Screens/Auth_Views/Forgot_UserName/forgot_username_controller.dart';
import 'package:demo_app/Screens/Auth_Views/Login/login_view.dart';
import 'package:demo_app/Screens/Auth_Views/Reset_Password/reset_password_view.dart';
import 'package:demo_app/Screens/Home/DashBoard/dashboard.dart';
import 'package:demo_app/Screens/Splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/Auth_Views/Forgot_UserName/forgot_username_view.dart';
import '../Screens/Auth_Views/Signup/signup_view.dart';

class AllPages {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: splashScreen,
          page: () =>  SplashScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: loginScreen,
          page: () => const LoginScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: forgotUserNameScreen,
          page: () => const ForgotUserNameScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: signupScreen,
          page: () => const SignupScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: resetPasswordScreen,
          page: () => const ResetPasswordScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: dashboard,
          page: () =>  DashBoard(),
          binding: ScreenBindings()),

    ];
  }
}