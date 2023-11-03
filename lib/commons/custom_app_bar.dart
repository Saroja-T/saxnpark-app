import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/bloc/landing/landing_bloc.dart';
import 'package:saxnpark_app/utils/styles.dart';

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
      centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        title: Text(
          title,
        style: TextStyle(
          color: AppColors.black2,fontSize: 12.0,fontWeight: FontWeight.w600),));
  }
  
  @override
    Size get preferredSize => const Size.fromHeight(50);

}

class CustomAppBarWithBackAndSkip extends StatelessWidget implements PreferredSizeWidget 
{
  final String title;
  final String backText;
  final String? redirectionKey;
  final int? tabIndex;

  const CustomAppBarWithBackAndSkip({
    Key? key,
    required this.title,
    required this.backText,
    this.redirectionKey,
    this.tabIndex
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: tabIndex ?? 0, tabLabel: redirectionKey ?? ""));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16,0,0,0),
              child: Text(backText,style: customTextStyle(12, FontWeight.w400, AppColors.black5, 1),),
            ),
          )),
          actions: <Widget>[
    TextButton(
      onPressed: () {},
      child: Text('Skip',style: TextStyle(color: AppColors.black5),),
    ),
  ],
          title: Text(
          title,
        style: TextStyle(
          color: AppColors.black6,fontSize: 14.0,fontWeight: FontWeight.w600),));
  }
  
  @override
    Size get preferredSize => const Size.fromHeight(50);

}
class CustomAppBarWithBack extends StatelessWidget implements PreferredSizeWidget 
{
  final String title;
  final String backText;
  final String? redirectionKey;
  final int? tabIndex;

  const CustomAppBarWithBack({
    Key? key,
    required this.title,
    required this.backText,
    this.redirectionKey,
    this.tabIndex
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: tabIndex ?? 0, tabLabel: redirectionKey ?? ""));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16,0,0,0),
              child: Text(backText,style: customTextStyle(12, FontWeight.w400, AppColors.black5, 1),),
            ),
          )),
        title: Text(
          title,
        style: TextStyle(
          color: AppColors.black6,fontSize: 14.0,fontWeight: FontWeight.w600),));
  }
  
  @override
    Size get preferredSize => const Size.fromHeight(50);

}