
import 'package:demo_app/Utils/Colors.dart';
import 'package:demo_app/Utils/extentions.dart';
import 'package:flutter/material.dart';


Widget textView(String text, {TextAlign? textAlign, FontWeight? fontWeight}) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
    ),
    textAlign: textAlign,
  );
}

// Widget textField(
//     {String? title,
//     TextEditingController? controller,
//       bool?obscureText,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     int? maxLength,
//     TextInputType? inputType}) {
//   return TextFormField(
//     controller: controller,
//     style: const TextStyle(fontSize: 14),
//     validator: (val) {
//       if (val!.isEmpty) {
//         print('${maxLength != null &&  val.length > 10}_________');
//
//         return "$title field cannot be empty";
//
//       } else if (maxLength != null &&  val.length > 10) {
//         return "Please enter must 10 digit";
//       }
//     },
//     maxLength: maxLength,
//     keyboardType: inputType,
//     decoration: CustomInputDecoration.myCustomInputDecoration(
//       hintText: title,
//       prefixIcon: prefixIcon,
//     ),
//   );
// }
Widget textFormField(
    { String? title,
      bool? obscureText,
      bool? readOnly,
      TextEditingController? controller,
      Widget? prefixIcon,
      Widget? suffixIcon,
      int? maxLength,
      void Function()? onTap,

      bool?isValidate,
      String? Function(String?)? validator,
      TextInputType? inputType}) {
  return TextFormField(
      controller: controller,
  onTap: onTap,
    readOnly:readOnly??false,
    style: const TextStyle(fontSize: 14),
    obscureText:obscureText??false,
    maxLength: maxLength,
    clipBehavior: Clip.none,
    keyboardType: inputType,
    decoration: CustomInputDecoration.myCustomInputDecoration(
      hintText: title,
      prefixIcon: prefixIcon,
        isValidate:isValidate,
      suffixIcon: suffixIcon
    ),
    validator: validator
  );
}



