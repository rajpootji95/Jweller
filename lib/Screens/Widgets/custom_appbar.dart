
import 'package:demo_app/Utils/Colors.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget{
  final String? title;
  final String? notificationIcon;
  final String? leadingImage;
  final VoidCallback? onPressedLeading;
  final VoidCallback? onPressedNotification;
  final int? index;

  const CustomAppBar({
    Key? key,
    this.title,
    this.notificationIcon,
    this.leadingImage,
    this.onPressedLeading,
    this.onPressedNotification,this.index

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      decoration: const BoxDecoration(

      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                title ?? '83, Pink city, Indore',
                style: const TextStyle(
                  color: AppColors.whit,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(width: 10),
              notificationIcon != null ?Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color:AppColors.whit,
                    borderRadius: BorderRadius.circular(10)),
                child:
                    Image.asset(notificationIcon!, scale: 1.5),
              ): const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }

}
