import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String name;
  const CustomAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        title: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            name,
          style: TextStyle(
            color: AppColors.black2,fontSize: 12.0,fontWeight: FontWeight.w600),),
        ));
  }
}