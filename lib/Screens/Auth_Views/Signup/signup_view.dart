
import 'package:demo_app/Screens/Auth_Views/Signup/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../../../Routes/routes.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/extentions.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/validation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();

  final TextEditingController nameChildController = TextEditingController();
  final TextEditingController lastNameChildController = TextEditingController();
  final TextEditingController emailChildController = TextEditingController();
  final TextEditingController phoneChildController = TextEditingController();
  final TextEditingController dobChildController = TextEditingController();
  final TextEditingController cityChildController = TextEditingController();
  final TextEditingController postCodeChildController = TextEditingController();
  final TextEditingController address1ChildController = TextEditingController();
  final TextEditingController address2ChildController = TextEditingController();
  final TextEditingController address3ChildController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController firstNameChildController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int isCheck =  0;
  int isCheck1 =  0;
  bool isRemember1 = false;
  bool isRemember = false;
  int _value = 0;
  int _value1 = 0;
  bool isNonAvailable = false;
  bool isAvailable = false;
  showLoader() {
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
        init: SignupController(),
        builder: (controller) =>
          SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.container1Clr,

              body: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
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
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 20,),
                          Image.asset("assets/images/logname.png",scale: 1.2,),
                          const SizedBox(height: 10,),
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
                              child: Column(
                                children: [
                                  const SizedBox(height: 20,),
                                  const Text("Sign up", style: TextStyle(
                                      color: AppColors.whit,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),),
                                  const SizedBox(height: 8,),
                                   SizedBox(
                                     height: 320,
                                     child: SingleChildScrollView(
                                       child: Column(
                                         children: [
                                           const Text("I am already registered as a member?", style: TextStyle(
                                               color: AppColors.whit,
                                               fontWeight: FontWeight.normal,
                                               fontSize: 15),),
                                           Row(
                                             children: [
                                               Radio(
                                                 value: 0,
                                                 fillColor: MaterialStateColor.resolveWith(
                                                         (states) => AppColors.primary),
                                                 activeColor: AppColors.primary,
                                                 groupValue: _value,
                                                 onChanged: (int? value) {
                                                   setState(() {
                                                     _value = value!;
                                                     isAvailable = false;

                                                   });
                                                 },
                                               ),
                                               const Text("Yes",
                                                 style: TextStyle(fontSize: 15,color: AppColors.whit),
                                               ),
                                               const SizedBox(
                                                 height: 5,
                                               ),
                                               Radio(
                                                   value: 1,
                                                   fillColor: MaterialStateColor.resolveWith(
                                                           (states) => AppColors.primary),
                                                   activeColor: AppColors.primary,
                                                   groupValue: _value,
                                                   onChanged: (int? value) {
                                                     setState(() {
                                                       _value = value!;
                                                       isAvailable = true;
                                                     });
                                                   }),
                                               // SizedBox(width: 10.0,),
                                               const Text("No",
                                                 style: TextStyle(fontSize: 15,color: AppColors.whit),
                                               ),
                                             ],
                                           ),

                                           isAvailable == false ?  Padding(
                                             padding: const EdgeInsets.only(left: 20,right: 20),
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [

                                                 const Row(
                                                   children: [
                                                     Text("Username",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
                                                 //const Text("Username",style: TextStyle(color: AppColors.whit),),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   title: 'User Name',
                                                   prefixIcon: const Icon(Icons.person,size: 25,),
                                                   controller: nameController,
                                                   validator: Validation.validateUserNamePassLogIn,
                                                 ),
                                                 SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("Password",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
                                                 ///Text("Password",style: TextStyle(color: AppColors.whit),),
                                                 const SizedBox(height: 5,),
                                                 StatefulBuilder(
                                                     builder: (context,setState) {
                                                       return textFormField(
                                                         title: 'Password',
                                                         prefixIcon: const Icon(Icons.lock_outlined,size: 25,),
                                                         //obscureText: isObscure,
                                                         controller: passwordController,
                                                         validator: Validation.validateUserNamePassLogIn,
                                                         // suffixIcon: GestureDetector(
                                                         //     child: Icon(
                                                         //         isObscure
                                                         //             ? Icons.visibility_off
                                                         //             : Icons.visibility,
                                                         //         color: AppColors.fntClr,
                                                         //         size: 14),
                                                         //     onTap: () {
                                                         //       setState(() {
                                                         //         isObscure = !isObscure;
                                                         //       });
                                                         //     }),
                                                       );
                                                     }
                                                 ),
                                               ],
                                             ),
                                           )
                                               :Padding(
                                             padding: const EdgeInsets.only(left: 20,right: 20),
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 const Center(
                                                   child: Row(
                                                     mainAxisSize: MainAxisSize.min,
                                                     children: [
                                                       Text("Username : ", style: TextStyle(
                                                           color: AppColors.whit,
                                                           fontWeight: FontWeight.normal,
                                                           fontSize: 15),),
                                                       Text("137987", style: TextStyle(
                                                           color: AppColors.primary,
                                                           fontWeight: FontWeight.normal,
                                                           fontSize: 15),),
                                                     ],
                                                   ),
                                                 ),
                                                 const SizedBox(height: 16,),
                                                 const Row(
                                                   children: [
                                                     Text("First Name",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   title: 'First Name',
                                                   prefixIcon: const Icon(Icons.person,size: 25,),
                                                   controller: firstNameController,
                                                   validator: Validation.validateCommon,
                                                   isValidate:true
                                                 ),
                                                 const SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("Last Name",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   title: 'Last Name',
                                                   prefixIcon: const Icon(Icons.person,size: 25,),
                                                   controller: lastNameController,
                                                     validator: Validation.validateCommon,
                                                     isValidate:true
                                                 ),
                                                 const SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("E-mail",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   inputType: TextInputType.emailAddress,
                                                   title: 'Email',
                                                   prefixIcon: const Icon(Icons.email_outlined,size: 25,),
                                                   controller: emailController,
                                                     validator: Validation.validateEmailId,
                                                     isValidate:true
                                                 ),

                                                 const SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("Phone Number",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),

                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   inputType: TextInputType.number,
                                                   title: 'Mobile',
                                                   prefixIcon: const Icon(Icons.call,size: 25,),
                                                   controller: phoneController,
                                                   validator: Validation.validateMobileNumber,
                                                     isValidate:true
                                                 ),
                                                 const SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("DOB",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
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
                                                 const SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("Address Line 1",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   title: 'Start Typing',
                                                   prefixIcon: const Icon(Icons.location_on_outlined,size: 25,),
                                                   controller: address1Controller,
                                                     validator: Validation.validateCommon,
                                                     isValidate:true
                                                 ),
                                                 const SizedBox(height: 10,),
                                                 Text("Address Line 2",style: TextStyle(color: AppColors.whit),),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   title: 'Address Line 2',
                                                   prefixIcon: const Icon(Icons.location_on_outlined,size: 25,),
                                                   controller: address2Controller,
                                                   validator: Validation.validateUserName,
                                                 ),
                                                 const SizedBox(height: 10,),
                                                 Text("Address Line 3",style: TextStyle(color: AppColors.whit),),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   title: 'Address Line 3',
                                                   prefixIcon: const Icon(Icons.location_on_outlined,size: 25,),
                                                   controller: address3Controller,
                                                   validator: Validation.validateUserName,
                                                 ),
                                                 const SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("City/Town/Village",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),
                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   title: 'City/Town/Village',
                                                   // prefixIcon: const Icon(Icons.person,size: 25,),
                                                   controller: cityController,
                                                     validator: Validation.validateCommon,
                                                     isValidate:true
                                                 ),
                                                 const SizedBox(height: 10,),
                                                 const Row(
                                                   children: [
                                                     Text("Post Code",style: TextStyle(color: AppColors.whit),),
                                                     Icon(Icons.star,color: AppColors.red,size: 8,)

                                                   ],
                                                 ),

                                                 const SizedBox(height: 5,),
                                                 textFormField(
                                                   inputType: TextInputType.number,
                                                   title: 'Post Code',
                                                   controller: postCodeController,
                                                     validator: Validation.validateCommon,
                                                     isValidate:true
                                                 ),

                                                 Row(
                                                   children: [
                                                     Radio(
                                                       value: 0,
                                                       fillColor: MaterialStateColor.resolveWith(
                                                               (states) => AppColors.primary),
                                                       activeColor: AppColors.primary,
                                                       groupValue: _value1,
                                                       onChanged: (int? value) {
                                                         setState(() {
                                                           _value1 = value!;
                                                           isNonAvailable = false;

                                                         });
                                                       },
                                                     ),
                                                     const Text("Yes",
                                                       style: TextStyle(fontSize: 15,color: AppColors.whit),
                                                     ),
                                                     const SizedBox(
                                                       height: 5,
                                                     ),
                                                     Radio(
                                                         value: 1,
                                                         fillColor: MaterialStateColor.resolveWith(
                                                                 (states) => AppColors.primary),
                                                         activeColor: AppColors.primary,
                                                         groupValue: _value1,
                                                         onChanged: (int? value) {
                                                           setState(() {
                                                             _value1 = value!;
                                                             isNonAvailable = true;
                                                           });
                                                         }),
                                                     // SizedBox(width: 10.0,),
                                                     const Text("No",
                                                       style: TextStyle(fontSize: 15,color: AppColors.whit),
                                                     ),
                                                   ],
                                                 ),

                                                 isNonAvailable == false ?
                                                 Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     const Center(
                                                       child: Row(
                                                         mainAxisSize: MainAxisSize.min,
                                                         children: [
                                                           Text("Username : ", style: TextStyle(
                                                               color: AppColors.whit,
                                                               fontWeight: FontWeight.normal,
                                                               fontSize: 15),),
                                                           Text("137987", style: TextStyle(
                                                               color: AppColors.primary,
                                                               fontWeight: FontWeight.normal,
                                                               fontSize: 15),),
                                                         ],
                                                       ),
                                                     ),
                                                     const SizedBox(height: 16,),
                                                     const Row(
                                                       children: [
                                                         Text("First Name",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),
                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       title: 'First Name',
                                                       prefixIcon: const Icon(Icons.person,size: 25,),
                                                       controller: firstNameChildController,
                                                     ),
                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("Last Name",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),
                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       title: 'Last Name',
                                                       prefixIcon: const Icon(Icons.person,size: 25,),
                                                       controller: lastNameChildController,
                                                     ),
                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("E-mail",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),
                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       inputType: TextInputType.emailAddress,
                                                       title: 'Email',
                                                       prefixIcon: const Icon(Icons.email_outlined,size: 25,),
                                                       controller: emailChildController,
                                                     ),

                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("Phone Number",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),

                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       inputType: TextInputType.number,
                                                       title: 'Mobile',
                                                       prefixIcon: const Icon(Icons.call,size: 25,),
                                                       controller: phoneChildController,
                                                     ),

                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("DOB",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),
                                                     const SizedBox(height: 5,),
                                                     StatefulBuilder(
                                                         builder: (context,setState) {
                                                           return textFormField(
                                                               onTap: (){
                                                                 showBirthChildDatePicker(context: context);
                                                               },
                                                               title: 'DOB',
                                                               readOnly: true,
                                                               prefixIcon: const Icon(Icons.calendar_month_rounded,size: 25,),
                                                               controller: dobChildController,
                                                           );
                                                         }
                                                     ),
                                                     const SizedBox(height: 10,),
                                                      Row(
                                                       children: [
                                                         Text("Address Line 1",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,),
                                                         isCheck1 == 0
                                                             ? Padding(
                                                           padding: const EdgeInsets.only(left: 0),
                                                           child: Row(
                                                             children: [
                                                               InkWell(
                                                                 onTap: () {
                                                                   setState(() {
                                                                     isRemember1 = !isRemember1;
                                                                   });
                                                                 },
                                                                 child: Container(
                                                                   decoration: BoxDecoration(
                                                                     borderRadius: BorderRadius.circular(10),
                                                                   ),
                                                                   child: Padding(
                                                                     padding: const EdgeInsets.all(5),
                                                                     child: Icon(
                                                                       isRemember1
                                                                           ? Icons.check_box
                                                                           : Icons.check_box_outline_blank,
                                                                       color: isRemember1 ? Colors.yellow : Colors.white,
                                                                     ),
                                                                   ),
                                                                 ),
                                                               ),
                                                               const SizedBox(
                                                                 width: 5,
                                                               ),
                                                               const Text(
                                                                 'Same as above',
                                                                 style: TextStyle(
                                                                   fontSize: 11,
                                                                   fontWeight: FontWeight.normal,
                                                                   color: Colors.white,
                                                                 ),
                                                               ),
                                                             ],
                                                           ),
                                                         )
                                                             : Container(),
                                                       ],
                                                     ),

                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       title: 'Address Line 1',
                                                       prefixIcon: const Icon(Icons.location_on_outlined,size: 25,),
                                                       controller: address1ChildController,
                                                     ),
                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("Address Line 2",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),
                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       title: 'Address Line 2',
                                                       prefixIcon: const Icon(Icons.location_on_outlined,size: 25,),
                                                       controller: address2ChildController,
                                                     ),
                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("Address Line 3",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),
                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       title: 'Address Line 3',
                                                       prefixIcon: const Icon(Icons.location_on_outlined,size: 25,),
                                                       controller: address3ChildController,
                                                     ),
                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("City/Town/Village",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),
                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       title: 'City/Town/Village',
                                                       // prefixIcon: const Icon(Icons.person,size: 25,),
                                                       controller: cityChildController,
                                                     ),
                                                     const SizedBox(height: 10,),
                                                     const Row(
                                                       children: [
                                                         Text("Post Code",style: TextStyle(color: AppColors.whit),),
                                                         Icon(Icons.star,color: AppColors.red,size: 8,)

                                                       ],
                                                     ),

                                                     const SizedBox(height: 5,),
                                                     textFormField(
                                                       inputType: TextInputType.number,
                                                       title: 'Post Code',
                                                       controller: postCodeChildController,
                                                     ),
                                                   ],
                                                 ) :SizedBox.shrink()
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),

                                  const SizedBox(height: 10,),
                                  isCheck == 0
                                      ? Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isRemember = !isRemember;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Icon(
                                                isRemember
                                                    ? Icons.check_box
                                                    : Icons.check_box_outline_blank,
                                                color: isRemember ? Colors.yellow : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),


                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'By signing up you agree to our',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'Terms & Conditions and Privacy Policy.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                      : Container(),
                                  const SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: AppButton(
                                        title: controller.isLoading == true
                                            ? 'please wait...'
                                            : 'Continue', onTap: () async {
                                          await showLoader();
                                      if (_formKey.currentState!.validate()) {
                                        Fluttertoast.showToast(msg: "dsffgg");
                                      } else {
                                        // Fluttertoast.showToast(
                                        //     msg: "Please enter mobile number");
                                      }
                                    }),
                                  ),


                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already signed up?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.whit),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(loginScreen);
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                                color: AppColors.secondary,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal
                                            ),
                                          ))
                                    ],
                                  ),
                                  // const SizedBox(height: 40,),
                                ],
                              ),
                            ),

                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/25.0,),
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
        );
  }


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

  showBirthChildDatePicker({required BuildContext context}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      dobChildController.text = DateFormat("dd/MM/yyyy").format(pickedDate);

    }
  }

}
