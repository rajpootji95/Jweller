
import 'dart:convert';

import 'package:demo_app/Routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controllers/app_base_controller/app_base_controller.dart';
import '../../../Models/get_dashboard_model.dart';


class DashBoardController extends AppBaseController {
  RxBool isLoading = false.obs ;


  @override
  onInit() async {
    super.onInit();
    await  getCustomerId();
  }
  signOut() async {
    await setLogOut();
    Get.toNamed(loginScreen);
  }
  String ?customerId,userType;
  setLogOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isLoggedIn", false);
    customerId = preferences.getString("customerId");
    print(customerId);

  }
   getCustomerId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    customerId = preferences.getString("customerId");
    userType = preferences.getString("userType");

    getDataListApi();
  }
  GetResponseModel ?getResponseModel;
  getDataListApi() async {
    isLoading == true;
    var headers = {
      'Cookie': 'ci_session=ssrg9mh5h08lve1kdnu0vprtb2d7mf8j'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://delristech-projects.in/php/j2/index.php/UserApi/instalments'));
    request.fields.addAll({
      'customer_id':customerId.toString(),
       'user_type': userType.toString()
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult  = GetResponseModel.fromJson(jsonDecode(result));
        getResponseModel =  finalResult;
      update();
      // if(finalResult.error == false){
      //   isLoading == false;
      //   update();
      // }
      // else{
      //   isLoading == false;
      //   update();
      //
      // }
      // //Get.toNamed(dashboard);
    }
    else {
      isLoading == false;
      update();
      print(response.reasonPhrase);
    }

  }


}
