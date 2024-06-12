
import 'package:demo_app/Screens/Auth_Views/Login/login_controller.dart';
import 'package:demo_app/Screens/Widgets/app_button.dart';
import 'package:demo_app/Utils/Colors.dart';
import 'package:demo_app/Utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Routes/routes.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/validation.dart';
import 'forgot_username_controller.dart';

class ForgotUserNameScreen extends StatefulWidget {
  const ForgotUserNameScreen({Key? key}) : super(key: key);

  @override
  State<ForgotUserNameScreen> createState() => _ForgotUserNameScreenState();
}

class _ForgotUserNameScreenState extends State<ForgotUserNameScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  int isCheck =  0;
  bool isRemember = false;
  bool isObscure = false;
  showBirthDatePicker({required BuildContext context}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime.now());
    if (pickedDate != null) {
        dobController.text = DateFormat("dd/MM/yyyy").format(pickedDate);

    }
  }
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
      init: ForgotUserNameController(),
      builder: (controller) =>
          SafeArea(
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
                              Image.asset("assets/images/logname.png",scale: 1.2,),
                            SizedBox(height: MediaQuery.of(context).size.height/15.0,),


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
                                  const Text("Forgot Username", style: TextStyle(
                                      color: AppColors.whit,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),),
                                  const SizedBox(height: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const Text("Email",style: TextStyle(color: AppColors.whit),),
                                    const SizedBox(height: 5,),
                                    textFormField(
                                      title: 'Enter Email Address',
                                      prefixIcon: const Icon(Icons.email_outlined,size: 25,),
                                      controller: nameController,
                                      validator: Validation.validateEmailId,
                                      isValidate: true
                                    ),
                                    SizedBox(height: 10,),
                                    Text("DOB",style: TextStyle(color: AppColors.whit),),
                                    const SizedBox(height: 5,),
                                    StatefulBuilder(
                                        builder: (context,setState) {
                                          return textFormField(
                                            onTap: (){
                                              showBirthDatePicker(context: context);
                                            },
                                            title: 'DOB',
                                            readOnly: true,
                                            prefixIcon: const Icon(Icons.calendar_month_rounded,size: 25,),
                                            controller: dobController,
                                            validator: Validation.validateCommon,
                                              isValidate: true
                                          );
                                        }
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Phone Number",style: TextStyle(color: AppColors.whit),),
                                    const SizedBox(height: 5,),
                                    textFormField(
                                      title: 'Enter Phone Number',
                                      prefixIcon: const Icon(Icons.phone,size: 25,),
                                      controller: phoneController,
                                      validator: Validation.validateMobileNumber,
                                        isValidate: true
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20,),
                                  AppButton(
                                      title: controller.isLoading == true
                                          ? 'please wait...'
                                          : 'Send', onTap: () async {
                                        await showLoader();
                                    if (_formkey.currentState!.validate()) {
                                      Fluttertoast.showToast(msg: "dsffgg");
                                    }
                                  }),

                                      ],
                                     ),
                          ),
                                 ),

                              ),
                               SizedBox(height: MediaQuery.of(context).size.height/7.0,),
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
