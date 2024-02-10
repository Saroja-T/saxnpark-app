import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';


class SignoutBottomSheet extends StatelessWidget {
  const SignoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: h! * 0.38,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppColors.grey14,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Icon(
                            Icons.close,
                            color: AppColors.grey13,
                          )),
                    )
                  ],
                ),
              
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(
                  height: h! * 0.015,
                ),
                Text(
                  Strings.signInToContinue,
                  style:
                      customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
                ),
                SizedBox(
                  height: h! * 0.015,
                ),
                 Text(
                      Strings.saveYourInfo,
                      style: customTextStyle(
                          14, FontWeight.w400, AppColors.black6, 0),
                    ),
               
                SizedBox(
                  height: h! * 0.04,
                ),
              ],),
                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.black6),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ))),
                      onPressed: () {
                        //Navigator.pop(context);
                         Navigator.pushReplacementNamed(
                                    context, '/login');
                      },
                      child: Text(
                        Strings.signin,
                        style: customTextStyle(
                            14, FontWeight.w600, AppColors.white, 1),
                      )),
                ),

                SizedBox(
                  height: h! * 0.04,
                ),
                RichText(
                    text: TextSpan(
                      style: customTextStyle(
                          16, FontWeight.w400, AppColors.black6, 1),
                      children: <TextSpan>[
                        TextSpan(text: Strings.dontHaveAnAccount),
                        TextSpan(
                            text: Strings.createAccount,
                            style: customTextStyleWithUnderline(
                                16, FontWeight.w700, AppColors.black6, 1,AppColors.black6),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, '/register');
                              }),
                      ],
                    ),
                  ),
              ]),
    );
  }
}