


import 'package:demo_app/Utils/Colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
   AppButton({Key? key,this.onTap, this.title,this.height }) : super(key: key);

 final String? title ;
  double? height  ;
  final VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??45,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5),
            )),
        child:  Text(
          title ?? '',
          style: const TextStyle(
            //decoration: TextDecoration.underline,
            color: AppColors.activeBorder,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
