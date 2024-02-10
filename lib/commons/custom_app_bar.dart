import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/bloc/landing/landing_bloc.dart';
import 'package:saxnpark_app/pages/landing_page.dart';
import 'package:saxnpark_app/utils/styles.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';

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
              color: AppColors.black2,
              fontSize: 12.0,
              fontWeight: FontWeight.w600),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class CustomAppBarWithBackAndSkip extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String backText;
  final String? redirectionKey;
  final int? tabIndex;

  const CustomAppBarWithBackAndSkip(
      {Key? key,
      required this.title,
      required this.backText,
      this.redirectionKey,
      this.tabIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
              child: TextButton(
                  onPressed: () {
                    if (title == Strings.signin ||
                        title == Strings.createAccount) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    backText,
                    style: customTextStyle(
                        12, FontWeight.w400, AppColors.black5, 0),
                  )),
            )),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (title == Strings.createAccount) {
                context
                    .read<LandingBloc>()
                    .add(TabChangeEvent(tabIndex: 0, tabLabel: Strings.rHome));
                Navigator.pushNamedAndRemoveUntil(
                              context, '/landingpage', (route) => false);
              }
            },
            child: Text(
              'Skip',
              style: TextStyle(color: AppColors.black5),
            ),
          ),
        ],
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.black6,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class CustomAppBarWithBack extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String backText;
  final String? redirectionKey;
  final int? tabIndex;

  const CustomAppBarWithBack(
      {Key? key,
      required this.title,
      required this.backText,
      this.redirectionKey,
      this.tabIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        elevation: 0.5,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: TextButton(
              onPressed: (){
                // print(context.watch<LandingBloc>().state.tabLabel);
                if(Strings.register==title || Strings.passwordReset==title ||Strings.password==title 
                 || Strings.signin==title || Strings.verification==title||Strings.contactUs==title){
                  Navigator.pop(context);
                }else{
                  context.read<LandingBloc>().add(TabChangeEvent(
                        tabIndex:tabIndex!, tabLabel: redirectionKey!));
                }
              },
              child: Text(backText,style: customTextStyle(12, FontWeight.w400, AppColors.black5, 0),)),
          )),
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.black6,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class CustomAppBarWithSkip extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String? redirectionKey;
  final int? tabIndex;

  const CustomAppBarWithSkip(
      {Key? key, required this.title, this.redirectionKey, this.tabIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (title == Strings.createAccount) {
                Navigator.pushReplacementNamed(context, '/generalHome');
              }
            },
            child: Text(
              'Skip',
              style: TextStyle(color: AppColors.black5),
            ),
          ),
        ],
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.black6,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
