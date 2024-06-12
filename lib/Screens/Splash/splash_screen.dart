import 'package:demo_app/Routes/routes.dart';
import 'package:demo_app/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogIn();
  }
  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.sizeOf(context).height;
    final widthSize = MediaQuery.sizeOf(context).width;
    return GetBuilder(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              height:heightSize,
              width: widthSize,
              decoration: const BoxDecoration(
                color:AppColors.whit,

              ),
             child:const Center(child:  Text("Jewellery App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),))
            ),
          );
        });
  }


  checkLogIn()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isLoggedIn =  preferences.getBool("isLoggedIn") ;
    debugPrint("this is A ${isLoggedIn}");
    navigate(isLoggedIn??false);
  }

  navigate(isLoggedIn)  {
    Future.delayed(const Duration(seconds: 2), () {
      if(isLoggedIn){
        Get.offAllNamed(dashboard);
      }else {
        Get.offAllNamed(loginScreen);
      }
    });
  }
}
