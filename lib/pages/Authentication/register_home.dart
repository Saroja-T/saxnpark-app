import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/exit_popup.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class RegisterHome extends StatefulWidget {
  const RegisterHome({super.key});
  @override
  State<RegisterHome> createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: login(context));
  }

  login(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          textDirection: TextDirection.rtl,
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                loginBg,
                fit: BoxFit.fill,
                opacity: const AlwaysStoppedAnimation(1),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(logo),
            ),
            Positioned(
              bottom: 24,
              child: Column(
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
                            Strings.registerkNow,
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
                  Row(
                    children: [
                      Text(
                        Strings.alreadyHaveAccount,
                        style: customTextStyle(
                            16, FontWeight.w400, AppColors.white, 1),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          Strings.signin,
                          style: customTextStyleWithUnderline(
                              16, FontWeight.w700, AppColors.white, 1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
