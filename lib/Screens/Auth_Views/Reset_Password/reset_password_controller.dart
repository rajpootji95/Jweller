
import 'package:demo_app/Controllers/app_base_controller/app_base_controller.dart';
import 'package:get/get.dart';

class ResetPasswordController extends AppBaseController {

  bool isHidden = true;


  RxBool isLoading = false.obs ;


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // TODO: implement initState
  }

  void togglePasswordView() {
    isHidden = !isHidden;
  }



  Future<void> forgotEmail(
      {required String email}) async {
       isLoading.value = true ;
  }
}