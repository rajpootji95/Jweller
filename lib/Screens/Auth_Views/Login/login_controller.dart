

import 'dart:convert';

import 'package:demo_app/Controllers/app_base_controller/app_base_controller.dart';
import 'package:demo_app/Routes/routes.dart';
import 'package:demo_app/Screens/Home/DashBoard/dashboard.dart';
import 'package:demo_app/Utils/Colors.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart' hide FormData;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Api Services/api_end_points.dart';
import '../../../Models/login_response_model.dart';

class LoginController extends AppBaseController {
  bool isHidden = true;

  bool isLoading = false;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await loginToken();
    super.onInit();
    // TODO: implement initState
  }

  void togglePasswordView() {
    isHidden = !isHidden;
  }

  Future showLoader(context) async {
    showDialog(
        context: context,
        builder: (_) {
          return const CupertinoActivityIndicator(
            color: AppColors.primary,
          );
        });
  }

  LoginResponseModel? loginResponseModel;

  getLoginApi(String phone, String password,context) async {
    showLoader(context);
    isLoading == true;
    var headers = {
      'Cookie': 'ci_session=ssrg9mh5h08lve1kdnu0vprtb2d7mf8j'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://delristech-projects.in/php/j2/index.php/UserApi/UserLogin'));
    request.fields.addAll({
      'username': phone.toString(),
      'password': password.toString(),
      'fcm_id': token.toString(),
    });
   debugPrint(request.fields.toString());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
       loginResponseModel  = LoginResponseModel.fromJson(jsonDecode(result));
      if(loginResponseModel?.error ==  false){
        setLogin();
        Get.toNamed(dashboard,arguments: loginResponseModel);
        isLoading == false;
        update();
      }
      else{
        Navigator.pop(context);
        isLoading == false;
        update();

      }
      //Get.toNamed(dashboard);
    }
    else {
      isLoading == false;
        update();
     Navigator.pop(context);

      print(response.reasonPhrase);
    }

  }

    setLogin() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("isLoggedIn", true);
      preferences.setString(
          "customerId", loginResponseModel?.data?.customerId ?? "");
      preferences.setString(
          "userType", loginResponseModel?.data?.userType ?? "");
    }
  String? token;
  loginToken() async {
      token = await FirebaseMessaging.instance.getToken();
      print("this is ia Token---->${token}");

  }

}
