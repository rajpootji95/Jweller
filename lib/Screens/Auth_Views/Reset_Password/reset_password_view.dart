
import 'package:demo_app/Screens/Auth_Views/Login/login_controller.dart';
import 'package:demo_app/Screens/Auth_Views/Reset_Password/reset_password_controller.dart';
import 'package:demo_app/Screens/Widgets/app_button.dart';
import 'package:demo_app/Utils/Colors.dart';
import 'package:demo_app/Utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Routes/routes.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/validation.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  int isCheck =  0;
  bool isRemember = false;
  bool isObscure = false;
  bool isLoading = false;
   showLoader(){
     showDialog(
         context: context,
         builder: (_){
           Future.delayed(const Duration(seconds: 2),(){
             Navigator.pop(context);
           });
           return  CupertinoActivityIndicator(
             color: AppColors.primary,
           );

         });
   }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ResetPasswordController(),
      builder: (controller) =>
          SafeArea (
            child: Scaffold(
              backgroundColor: AppColors.container1Clr,

              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration:  const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          AppColors.containerClr,
                          AppColors.container1Clr,
                        ],
                      )
                  ),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 20,),
                            Image.asset("assets/images/logname.png",scale: 1.2,),
                            SizedBox(height: MediaQuery.of(context).size.height/5.0,),

                            Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.all(10),
                              child: Container(
                                // height: MediaQuery.of(context).size.height/2.5,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0,
                                          spreadRadius: 5
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColors.whit),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        AppColors.containerClr,
                                        AppColors.container1Clr,
                                      ],

                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20, bottom:20),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20,),
                                      const Text("Reset Password", style: TextStyle(
                                          color: AppColors.whit,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),),
                                      const SizedBox(height: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          const Row(
                                              children:[
                                                Text("Username",style: TextStyle(color: AppColors.whit),),
                                                Icon(Icons.star,color:AppColors.red,size:9)
                                              ]
                                          ),
                                          const SizedBox(height: 5,),
                                          textFormField(
                                              title: 'Enter Username',
                                              prefixIcon: const Icon(Icons.person,size: 25,),
                                              controller: nameController,
                                              validator: Validation.validateUserName,
                                              isValidate: true
                                          ),

                                        ],
                                      ),

                                      const SizedBox(height: 20,),
                                      AppButton(
                                        height: 35,
                                          title: controller.isLoading == true
                                              ? 'please wait...'
                                              : 'Send Password Reset Link', onTap: () async {
                                         await  showLoader();
                                        if (_formkey.currentState!.validate()) {
                                          Fluttertoast.showToast(msg: "dsffgg");
                                        }
                                      }),

                                    ],
                                  ),
                                ),
                              ),

                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/6.0,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset("assets/images/football_login1.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
