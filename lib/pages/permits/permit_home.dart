import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/exit_popup.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class PermitHome extends StatefulWidget {
  const PermitHome({super.key});
  @override
  State<PermitHome> createState() => PermitHomeState();
}

class PermitHomeState extends State<PermitHome> {
  final PageController _pageController = PageController();
  final int _numPages = 3; // Adjust the number of pages as needed
  int _currentPage = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
   _timer = Timer.periodic(Duration(seconds: 3), _handleTimer);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: login(context));
  }

  login(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
        color: AppColors.black1,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            textDirection: TextDirection.rtl,
            fit: StackFit.loose,
            children: <Widget>[
              Positioned(
                top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    groupX,
                    fit: BoxFit.fill,
                    // opacity: const AlwaysStoppedAnimation(1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.3,
                      ),
                      SizedBox(
                        height:
                            150, // Adjust the height of the PageView as needed
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: [
                            // Your pages go here
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Strings.permitAccount,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  Text(Strings.permitAccount1,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(Strings.finishedPermit,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(Strings.finishedPermit1,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Strings.permitAccount,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  Text(Strings.permitAccount1,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(Strings.finishedPermit,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(Strings.finishedPermit1,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Strings.permitAccount,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  Text(Strings.permitAccount1,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(Strings.finishedPermit,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(Strings.finishedPermit1,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DotsIndicator(
                        dotsCount: _numPages,
                        position: _currentPage,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          color: Colors.grey, // Inactive dot color
                          activeColor: Colors.blue, // Active dot color
                          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ]),
              ),
              Positioned(
                bottom: 30,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: SizedBox(
                          child: ElevatedButton(
                            style: registerButtonStyle,
                            onPressed: () {
                              // Navigator.pushReplacementNamed(context, '/landingpage');
                              Navigator.pop(context);
                              context.read<LandingBloc>().add(TabChangeEvent(
                                  tabIndex: 4, tabLabel: Strings.rAddPermit));
                            },
                            child: Text(
                              Strings.addPermit,
                              style: customTextStyle(
                                  16, FontWeight.w700, AppColors.black6, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  

  void _handleTimer(Timer timer) {
    if (_currentPage < _numPages - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    _pageController.animateToPage(
      _currentPage.toInt(),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
