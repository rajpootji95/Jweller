import 'package:demo_app/Screens/Auth_Views/Forgot_UserName/forgot_username_view.dart';
import 'package:demo_app/Screens/Auth_Views/Login/login_controller.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int isCheck = 0;
  bool isRemember = false;
  bool isObscure = true;



  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
       backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: WillPopScope(
              onWillPop: () async {
                bool exit = await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text("Do you want to Exit App?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.green),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(color: AppColors.red),
                              )),
                        ],
                      );
                    });
                return exit;
              },
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                         SizedBox(
                          height: MediaQuery.of(context).size.height/5.0,
                        ),
                        Container(
                          decoration: BoxDecoration(

                            // color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),

                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 9,
                              ),
                            ],
                          ),
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.all(10),
                            child: Container(

                              decoration:  const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.whit,
                                    AppColors.whit,
                                  ],
                                )
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Text(
                                              "User Name",
                                              style: TextStyle(
                                                  color: AppColors.blackColor),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: AppColors.red,
                                              size: 8,
                                            )
                                          ],
                                        ),
                                        //const Text("Username",style: TextStyle(color: AppColors.whit),),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        textFormField(
                                          inputType: TextInputType.name,
                                          title: 'User Name',
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            size: 25,
                                          ),
                                          maxLength: 10,
                                          controller: phoneController,
                                          validator: Validation.validateUserName,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              "Password",
                                              style: TextStyle(
                                                  color: AppColors.blackColor),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: AppColors.red,
                                              size: 8,
                                            )
                                          ],
                                        ),

                                        ///Text("Password",style: TextStyle(color: AppColors.whit),),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        StatefulBuilder(
                                            builder: (context, setState) {
                                          return textFormField(
                                            title: 'Password',
                                            prefixIcon: const Icon(
                                              Icons.lock_outlined,
                                              size: 25,
                                            ),
                                            obscureText: isObscure,
                                            controller: passwordController,
                                            validator: Validation.validatePassword,
                                            suffixIcon: GestureDetector(
                                                child: Icon(
                                                    isObscure
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: AppColors.fntClr,
                                                    size: 14),
                                                onTap: () {
                                                  setState(() {
                                                    isObscure = !isObscure;
                                                  });
                                                }),
                                          );
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 50,),
                                    AppButton(
                                        title: controller.isLoading == true
                                            ? 'please wait...'
                                            : 'Login',
                                        onTap: () async {
                                          if (_formKey.currentState!.validate()) {
                                            controller.getLoginApi(phoneController.text, passwordController.text, context);
                                          } else if (phoneController.text.isEmpty) {
                                            Fluttertoast.showToast(msg: "Please Enter User Name!");
                                          }else if (passwordController.text.isEmpty) {
                                            Fluttertoast.showToast(msg: "Please Enter Password!");
                                          }
                                        }),
                                    const SizedBox(height: 50,),
                                  ],
                                ),
                              ),
                            ),
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
