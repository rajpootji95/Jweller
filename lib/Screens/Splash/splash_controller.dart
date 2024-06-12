import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import '../../Controllers/app_base_controller/app_base_controller.dart';

class SplashController extends AppBaseController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

  }



}