
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppBaseController extends GetxController {

//  Api api = Api() ;

  bool isBusy = false ;
  double width = 0 ;
  double height = 0 ;

  String imageUrl2 =
      'https://punjablottery.online/';
  void setBusy(bool value) {
    isBusy = value;
    update();
  }

  double getWidth(BuildContext context){
    return width = MediaQuery.of(context).size.width;
  }
  double getHeight(BuildContext context){
    return height = MediaQuery.of(context).size.height;
  }

}