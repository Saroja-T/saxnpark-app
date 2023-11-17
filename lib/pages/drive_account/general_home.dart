import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/exit_popup.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class GeneralHome extends StatefulWidget {
  const GeneralHome({super.key});
  @override
  State<GeneralHome> createState() => GeneralHomeState();
}

class GeneralHomeState extends State<GeneralHome>
    with TickerProviderStateMixin {
  AnimationController? controllerLTR;
  AnimationController? controllerRTL;
  late Animation<double> animationLTR;
  late Animation<double> animationRTL;
  @override
  void initState() {
    super.initState();

    // Animation setup
    controllerLTR = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animationLTR = Tween<double>(begin: -1.0, end: 0.0).animate(controllerLTR!);
    // Start the animation
    controllerLTR!.forward();

    // Animation setup
    controllerRTL = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animationRTL = Tween<double>(begin: 1.0, end: 0.0).animate(controllerRTL!);
    // Start the animation
    controllerRTL!.forward();
  }
  @override
  void dispose() {
    controllerLTR!.dispose();
    controllerRTL!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: login(context));
  }

  login(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
        color: AppColors.black7,
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
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                      AnimatedBuilder(
                        animation: animationLTR,
                        builder: (context, child) {
                          return FractionalTranslation(
                            translation: Offset(animationLTR.value, 0.0),
                            child: Text(
                              Strings.letsGet,
                              style: customTextStyle(
                                  76, FontWeight.w700, Colors.white, 0),
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: animationRTL,
                        builder: (context, child) {
                          return FractionalTranslation(
                            translation: Offset(animationRTL.value, 0.0),
                            child: Text(
                              Strings.started,
                              style: customTextStyle(
                                  76, FontWeight.w700, Colors.white, 0),
                            ),
                          );
                        },
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
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              Strings.createAccount,
                              style: customTextStyle(
                                  16, FontWeight.w700, AppColors.black6, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 0, tabLabel: Strings.rHome));
                          Navigator.pushReplacementNamed(
                              context, '/landingpage');
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: Container(
                            height: 51,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(color: AppColors.green1)),
                            child: Center(
                                child: Text(
                              Strings.seeParkingLocations,
                              style: customTextStyle(
                                  16, FontWeight.w700, AppColors.green1, 1),
                            )),
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
}
