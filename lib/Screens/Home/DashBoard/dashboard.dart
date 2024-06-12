
import 'package:demo_app/Screens/Home/DashBoard/dashboard_controller.dart';
import 'package:demo_app/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Models/get_dashboard_model.dart';


class DashBoard extends StatefulWidget {
  GetResponseModel? getResponseModel;
   DashBoard({super.key,this.getResponseModel});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashBoardController(),
      builder: (controller) {
        return  Scaffold(
            backgroundColor: AppColors.whit,
          appBar: AppBar(
            elevation: 0,
              centerTitle: true,
              title: const Text("Instalments",style: TextStyle(color: AppColors.blackColor,fontSize: 20),),
              backgroundColor: AppColors.whit,
            actions: [
              InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      String contentText = "";
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return SizedBox(
                            child: AlertDialog(

                              title: const SizedBox(

                                  child: Text("Are you sure want to logout")),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Card(
                                            elevation: 3,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Center(child: Text("No",style: TextStyle(color: AppColors.red),)),
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            controller.signOut();
                                          });
                                        },
                                        child: const Card(
                                            elevation: 3,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Center(child: Text("Yes",style: TextStyle(color: Colors.green))),
                                            )),
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          );
                        },
                      );
                    },
                  );

                },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.logout,color: AppColors.blackColor),
                  )),
            ],
          ),
          // drawer: Drawer(
          //
          // ),
          body: controller.getResponseModel == null ? const Center(child: CupertinoActivityIndicator(color: AppColors.primary,)): SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Customer Information's",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Container(
                    decoration: BoxDecoration(
                     // color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Card(

                      shape:  RoundedRectangleBorder(side: BorderSide(color: AppColors.primary.withOpacity(0.4)),borderRadius: BorderRadius.all(Radius.circular(10))),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Customer Name :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.customerDetails?.name.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Mobile Number :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.customerDetails?.mobile.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("WhatsApp Number :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.customerDetails?.whatsapNo.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Email ID :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.customerDetails?.emailId.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Address :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.customerDetails?.address.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),

                  const Text("Product Information's",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
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
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 9,
                          ),
                        ],
                      ),
                    child: Card(
                      color: AppColors.whit.withOpacity(0.9),
                       shape:  RoundedRectangleBorder(side: BorderSide(color: AppColors.primary.withOpacity(0.4)),borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Product Name :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.customerDetails?.productName.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Product Type :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.customerDetails?.productType.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Product Price :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("₹ ${controller.getResponseModel?.customerDetails?.productPrice.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Deposit Amount :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("₹ ${controller.getResponseModel?.customerDetails?.depositedAmount.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Instalment :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("₹ ${controller.getResponseModel?.customerDetails?.instalment.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),

                  const Text("Instalments Information's",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
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
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: Card(

                      shape:  RoundedRectangleBorder(side: BorderSide(color: AppColors.primary.withOpacity(0.4)),borderRadius: BorderRadius.all(Radius.circular(10))),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total Instalments :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.instalmentsDetails?.totalInstalments.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Paid Instalments :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.instalmentsDetails?.paidInstalments.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Unpaid Instalments :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.instalmentsDetails?.unpaidInstalments.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Delayed Instalments :",style: TextStyle(color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text("${controller.getResponseModel?.instalmentsDetails?.delayedInstalments.toString()}",style: const TextStyle(color: AppColors.blackColor,fontSize: 14,fontWeight: FontWeight.normal),),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Images",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
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
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: Card(
                      color: AppColors.whit.withOpacity(0.8),
                      shape:  RoundedRectangleBorder(side: BorderSide(color: AppColors.primary.withOpacity(0.4)),borderRadius: BorderRadius.all(Radius.circular(10))),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text("Buyer Image",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            width: double.infinity,
                                                 height: 100,
                                            child: Image.network("https://delristech-projects.in/php/j2/uploads/user_image/${controller.getResponseModel?.customerDetails?.buyerImg}",fit: BoxFit.fill,)),
                                      )


                                    ],
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text("Product Image",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                                height: 100,
                                            width: double.infinity,
                                            child: Image.network("https://delristech-projects.in/php/j2/uploads/product_image/${controller.getResponseModel?.customerDetails?.productImg}",fit: BoxFit.fill,)),
                                      )


                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  
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
                           color: Colors.grey.withOpacity(0.4),
                           spreadRadius: 2,
                           blurRadius: 9,
                         ),
                       ],
                     ),
                     child: Card(
                       shape:  RoundedRectangleBorder(side: BorderSide(color: AppColors.primary.withOpacity(0.4)),borderRadius: BorderRadius.all(Radius.circular(10))),

                       child: Column(
                         children: [
                           const Padding(
                             padding: EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Amount",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                 Text("Date",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold)),
                                 Text("Pay Date",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold)),
                                 Text("Status",style: TextStyle(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.bold)),
                               ],
                             ),
                           ),
                           const SizedBox(height: 10,),
                           ListView.builder(
                             shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                               itemCount: controller.getResponseModel?.data.length ?? 0,
                               itemBuilder: (context,index){
                                 var dataList = controller.getResponseModel?.data[index];
                                 return  Column(
                                   children: [
                                     Container(
                                       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                       color: index == 0 || index % 2 == 0? AppColors.greyColor.withOpacity(0.4):AppColors.whit.withOpacity(0.8),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [

                                           Text("₹ ${dataList?.amount.toString()}"),
                                           Text("${dataList?.depositDate.toString().replaceAll("00:00:00.000", '')}"),
                                           Text("${dataList?.paymentDate.toString().replaceAll("00:00:00.000", '')}"),
                                           dataList?.status == "1" ? Container(

                                               decoration: BoxDecoration(
                                                   color: Colors.green,
                                                   borderRadius: BorderRadius.circular(10)
                                               ),
                                               child: const Center(child: Padding(
                                                 padding: EdgeInsets.all(6.0),
                                                 child: Text("Paid",style: TextStyle(color: AppColors.whit),),
                                               ))):Container(

                                               decoration: BoxDecoration(
                                                   color: Colors.yellow,
                                                   borderRadius: BorderRadius.circular(10)
                                               ),
                                               child: const Center(child: Padding(
                                                 padding: EdgeInsets.all(6.0),
                                                 child: Text("Unpaid",style: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),),
                                               )))

                                         ],
                                       ),
                                     ),


                                   ],
                                 );
                               })
                         ],
                       ),
                     ),
                   )

                ],
              ),
            ),
          ),

        );
      }
    );
  }
}
