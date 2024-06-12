
import 'package:demo_app/Utils/Colors.dart';
import 'package:flutter/material.dart';

class DrawerIconTab extends StatefulWidget {
  final String? icon;
  final String? title;
  final int? tab;
  final int? index;

  const DrawerIconTab({Key? key, this.icon, this.title, this.tab, this.index})
      : super(key: key);

  @override
  State<DrawerIconTab> createState() => _DrawerIconTabState();
}

class _DrawerIconTabState extends State<DrawerIconTab> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Container(
            decoration:  BoxDecoration(
                color: widget.index == widget.tab ? AppColors.whit : AppColors.secondary , borderRadius: BorderRadius.circular(5)),
            height: 30,
            width: 30,
            child: Center(
                child: ImageIcon(
                  AssetImage(widget.icon ?? ''),
                  color: widget.index == widget.tab ? AppColors.secondary : AppColors.whit,
                  size: 20,
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            '${widget.title}',
            style: TextStyle(
                fontSize: 15,
                fontWeight: widget.index == widget.tab
                    ? FontWeight.normal
                    : FontWeight.bold,
                color:
                widget.index == widget.tab ? AppColors.whit : AppColors.fntClr),
          ),
        ],
      ),
    );
  }
}

