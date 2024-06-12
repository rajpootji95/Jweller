
import 'package:demo_app/Utils/Colors.dart';
import 'package:flutter/material.dart';

extension CustomBoxDecoration on BoxDecoration {
  static BoxDecoration myCustomDecoration({
    Color color = Colors.white,
    double boxShadowOpacity = 0.5,
    double boxShadowBlurRadius = 10,
    double boxShadowSpreadRadius = 0,
    double borderRadius = 10.0,
  }) {
    return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(boxShadowOpacity),
          blurRadius: boxShadowBlurRadius,
          spreadRadius: boxShadowSpreadRadius,
        ),
      ],
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}


extension CustomInputDecoration on InputDecoration {
  static InputDecoration myCustomInputDecoration({
    String? labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? isValidate,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(vertical: 8.0),
  }) {
    return  InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.secondary,
        ),
      ),
      errorStyle: TextStyle(color: isValidate?? false?Colors.red:Colors.transparent, fontSize: isValidate?? false?10:0),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.red,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.primary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.primary,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
    color: AppColors.red,
    ),
    ),
      fillColor:AppColors.whit,
      filled:true,
      isDense:true,
      labelText: labelText,
      prefixIcon: prefixIcon,
      prefixIconColor:Colors.grey ,
      suffixIcon: suffixIcon,
      hintText: hintText,
      counterText: "",
      );
  }
}