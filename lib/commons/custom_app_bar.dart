import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        title: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
          style: TextStyle(
            color: AppColors.black2,fontSize: 12.0,fontWeight: FontWeight.w600),),
        ));
  }
  
  @override
    Size get preferredSize => const Size.fromHeight(50);

}