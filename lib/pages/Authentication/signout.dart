import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../commons/otp_textfield.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class SignOut extends StatefulWidget {
  const SignOut({super.key});
  @override
  State<SignOut> createState() => SignOutState();
}

class SignOutState extends State<SignOut> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  bool isOtpEntered = false;

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
              title: Strings.account, backText: Strings.back,
              tabIndex: 0,redirectionKey: Strings.rHome,),
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
                          Strings.createAccount,
                          style: customTextStyle(
                              20, FontWeight.w500, AppColors.black1, 1),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          Strings.saveYourInfo,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black5, 1.2),
                        ),
                        SizedBox(
                          height: h!*0.04,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.black6),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ))),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: Text(
                                Strings.signin,
                                style: customTextStyle(
                                    16, FontWeight.w600, AppColors.white, 1),
                              )),
                        ),
                         SizedBox(
                          height: h!*0.03,
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              height: (h! * 0.06).ceilToDouble(),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  border: Border.all(color: AppColors.black6)),
                              child: Center(
                                  child: Text(
                                Strings.createAccount,
                                style: customTextStyle(
                                    16, FontWeight.w700, AppColors.black6, 1),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h!*0.04,
                    ),

                    Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.grey3)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Column(
                  children: [
                       
                    InkWell(
                      onTap: (){
                            context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 4, tabLabel: Strings.rHelp));
                      },
                      child: Row(
                        children: [
                          Image.asset(help),
                          const SizedBox(width: 8),
                          Text(
                            Strings.help,
                            style: customTextStyle(
                                14, FontWeight.w400, AppColors.grey6, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
                  ],
                ),
                
              ]),
            ),
          ))),
    );
  }
}
