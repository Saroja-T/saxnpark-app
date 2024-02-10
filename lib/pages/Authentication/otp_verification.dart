import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../commons/otp_textfield.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});
  @override
  State<OTPVerification> createState() => OTPVerificationState();
}

class OTPVerificationState extends State<OTPVerification> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  bool isOtpEntered = false;
  bool isOTPNotValid = false;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void resendCode() {
    //Api call for resending OTP
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandingBloc>(
          create: (context) => LandingBloc(),
        ),
      ],
      child: Scaffold(
          appBar: CustomAppBarWithBack(
              title: Strings.verification, backText: Strings.back),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          Strings.enterVerification,
                          style: customTextStyle(
                              20, FontWeight.w500, AppColors.black1, 1),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RichText(
                          text: TextSpan(
                            style: customTextStyle(
                                16, FontWeight.w400, AppColors.black5, 1.2),
                            children: <TextSpan>[
                              TextSpan(text: Strings.verificationMessage),
                              TextSpan(
                                text: "+44 7907 612422",
                                style: customTextStyle(
                                    16, FontWeight.w600, AppColors.black5, 1.2),
                              ),
                              TextSpan(
                                text: Strings.verificationMessage1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              Strings.editPhoneNumber,
                              style: customTextStyleWithUnderline(
                                  16,
                                  FontWeight.w400,
                                  AppColors.blue1,
                                  0,
                                  AppColors.blue1),
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          Strings.verificationCode,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black1, 1),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                            height: 60,
                            child: OTPTextField(
                              isVerified: (isAllFieldsFilled) {
                                setState(() {
                                  isOtpEntered = isAllFieldsFilled;
                                });

                                if (isAllFieldsFilled) {
                                  Timer.periodic(const Duration(seconds: 2),
                                      (timer) {
                                    if (!Strings.shouldRedirectToHome) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/generalHome', (route) => false);
                                    } else {
                                      setState(() {
                                        Strings.hasOldPassword = false;
                                      });
                                      Navigator.pushReplacementNamed(
                                          context, '/newPassword');
                                    }
                                  });
                                }
                              },
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        if (isOTPNotValid)
                          errorWidget(Strings.verificationCodeError)
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
                if (!isOtpEntered && enableResend)
                  TextButton(
                    onPressed: () {
                      resendCode();
                    },
                    child: Text(
                      Strings.sendAnother,
                      style: customTextStyle(
                          16, FontWeight.w400, AppColors.blue1, 1),
                    ),
                  ),
                if (isOtpEntered)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.grey10,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        Strings.verifying,
                        style: customTextStyle(
                            16, FontWeight.w400, AppColors.grey10, 1),
                      ),
                    ],
                  ),
                if (!isOtpEntered && !enableResend)
                  RichText(
                    text: TextSpan(
                      style: customTextStyle(
                          16, FontWeight.w400, AppColors.grey10, 1),
                      children: <TextSpan>[
                        TextSpan(text: Strings.sendAnother),
                        TextSpan(text: Strings.iN),
                        TextSpan(text: secondsRemaining.toString()),
                      ],
                    ),
                  ),
              ]),
            ),
          ))),
    );
  }
}
