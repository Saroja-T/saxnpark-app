import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});
  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  bool _showPassword = false;
  bool _numberValidationPassed = true;
  bool _passwordValidationPassed = true;

  String tabLabel = "";
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandingBloc>(
          create: (context) => LandingBloc(),
        ),
      ],
      child: Scaffold(
          appBar: CustomAppBarWithBack(
              title: Strings.passwordReset, backText: Strings.back),
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
                          Strings.resetPassword,
                          style: customTextStyle(
                              20, FontWeight.w500, AppColors.black1, 1),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          Strings.resetPasswordDescription,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black5, 1.2),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          Strings.phoneNumber,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black1, 1),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(color: AppColors.grey12)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/countrylist');
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      usIcon,
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Icon(Icons.keyboard_arrow_down_outlined,
                                        size: 16, color: AppColors.black6)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "+1",
                                style: customTextStyle(
                                    14, FontWeight.w400, AppColors.black5, 0),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '908 612 422',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.grey10)),
                                  onChanged: (val) {
                                    setState(() {
                                      if (_phoneController.text.isNotEmpty) {
                                        _numberValidationPassed = true;
                                      } else {
                                        _numberValidationPassed = false;
                                      }
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                     if (!_numberValidationPassed)
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            Strings.emptyNumberError,
                            style: customTextStyle(
                                12, FontWeight.w400, AppColors.red1, 1.2),
                          )),
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
                ElevatedButton(
                  style: registerBtnStyle,
                  onPressed: () {
                    if (_phoneController.text.isEmpty) {
                      setState(() {
                        _numberValidationPassed = false;
                      });
                    } else {
                      Navigator.pushNamed(context, '/otpVerification');
                    }
                  },
                  child: Text(
                    Strings.sendRestLink,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 51,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: AppColors.black6)),
                    child: Center(
                        child: Text(
                      Strings.backtoSignIn,
                      style: customTextStyle(
                          16, FontWeight.w700, AppColors.black6, 1),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    style: customTextStyle(
                        16, FontWeight.w400, AppColors.black6, 1),
                    children: <TextSpan>[
                      TextSpan(text: Strings.dontHaveAnAccount),
                      TextSpan(
                          text: Strings.register,
                          style: customTextStyleWithUnderline(
                              16, FontWeight.w700, AppColors.black6, 1),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, '/register');
                            }),
                    ],
                  ),
                ),
              ]),
            ),
          ))),
    );
  }
}
