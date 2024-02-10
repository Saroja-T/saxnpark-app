import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';
import 'package:saxnpark_app/utils/validations.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPassword = false;
  bool _numberValidationPassed = true;
  bool _passwordValidationPassed = true;
  bool _emailValidationPassed = true;

  String tabLabel = "";
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Validations validate = Validations();
  @override
  void initState() {
    super.initState();
    initialTimer();
  }

  void validateFields() {
    // Phone number validation
    _numberValidationPassed = _phoneController.text.isNotEmpty;
    // Password validation
    _passwordValidationPassed = _passwordController.text.isNotEmpty;
    // Email validation
    _emailValidationPassed = validate.isValidEmail(_emailController.text);
  }

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
          appBar: CustomAppBarWithBackAndSkip(
              title: Strings.signin, backText: Strings.back),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (Strings.passwordChanged)
                          NotificationBanner(
                            message: Strings.passwordUpdated,
                            isCancelAvailable: true,
                            isErrorMsg: false,
                            onCancel: () {
                              setState(() {
                                Strings.passwordChanged = false;
                              });
                            },
                          ),
                        if (Strings.accountLocked)
                          Container(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, right: 15),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(235, 77, 77, 0.1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset(
                                      info,
                                      color: AppColors.red1,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.0,
                                                  color: AppColors.black5,
                                                  height: 1.5),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '${Strings.securityAlert}\n',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12.0,
                                                      color: AppColors.black5,
                                                    )),
                                                TextSpan(
                                                    text:
                                                        '${Strings.securityAlertMsg}\n\n'),
                                                TextSpan(
                                                    text:
                                                        '${Strings.securityAlertMsg1}\n\n'),
                                                TextSpan(
                                                    text: Strings
                                                        .securityAlertMsg2),
                                              ])),
                                    ),
                                  ]),
                            ),
                          ),
                        if (Strings.passwordChanged || Strings.accountLocked)
                          const SizedBox(
                            height: 30,
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
                              border: Border.all(color: AppColors.grey3)),
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
                                      hintText: '908 612 421',
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 5),
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
                      errorWidget(Strings.emptyNumberError),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      Strings.emailAddress,
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
                          border: Border.all(color: AppColors.grey3)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.enterEmailAddress,
                                  hintStyle:
                                      TextStyle(color: AppColors.grey10)),
                              onChanged: (val) {
                                setState(() {
                                  if (_emailController.text.isNotEmpty) {
                                    _emailValidationPassed = true;
                                  } else {
                                    _emailValidationPassed = false;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!_emailValidationPassed)
                      errorWidget(Strings.emailError),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      Strings.password,
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
                          border: Border.all(color: AppColors.grey3)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.enterPassword,
                                  hintStyle:
                                      TextStyle(color: AppColors.grey10)),
                              obscureText: !_showPassword,
                              onChanged: (val) {
                                setState(() {
                                  if (_passwordController.text.isNotEmpty) {
                                    _passwordValidationPassed = true;
                                  } else {
                                    _passwordValidationPassed = false;
                                  }
                                });
                              },
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 17,
                                color: AppColors.black5,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                if (!_passwordValidationPassed)
                  errorWidget(Strings.emptyPasswordError),
                const SizedBox(
                  height: 12,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/passwordreset');
                        },
                        child: Text(
                          Strings.forgotPassword,
                          style: customTextStyleWithUnderline(
                              16,
                              FontWeight.w400,
                              AppColors.blue1,
                              1,
                              AppColors.blue1),
                        ))),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: registerBtnStyle,
                  onPressed: () {
                    setState(() {
                      validateFields();
                    });
                  },
                  child: Text(
                    Strings.signin,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(24, 0, 16, 0),
                        height: 1,
                        color: AppColors.grey9,
                      ),
                    ),
                    Text(
                      Strings.loginWith,
                      style: customTextStyle(
                          12, FontWeight.w400, AppColors.grey10, 1),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 24, 0),
                        height: 1,
                        color: AppColors.grey9,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                    height: 42,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 51,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grey8),
                                borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Image.asset(google),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 51,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grey8),
                                borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Image.asset(apple),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 51,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grey8),
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.asset(fb),
                          ),
                        ),
                      ],
                    )),
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
                              16,
                              FontWeight.w700,
                              AppColors.black6,
                              1,
                              AppColors.black6),
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

  void initialTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (this.mounted) {
        setState(() {
          Strings.passwordChanged = false;
        });
      }
    });
  }
}
