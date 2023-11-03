import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/colors.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _numberValidationPassed = true;
  bool _passwordValidationPassed = true;
  bool _confirmPasswordValidationPassed = true;

  String tabLabel = "";
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
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
                              onTap: () {},
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.gray1,
                                    radius: 10,
                                  ),
                                  const Icon(Icons.arrow_drop_down_outlined)
                                ],
                              ),
                            ),
                            Text(
                              "+1",
                              style: customTextStyle(
                                  16, FontWeight.w400, AppColors.black5, 1),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                controller: _phoneController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onEditingComplete: () {
                                  setState(() {
                                    if (_phoneController.text.length >= 10) {
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
                          Strings.numberError,
                          style: customTextStyle(
                              12, FontWeight.w400, AppColors.black5, 1.2),
                        )),
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
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Password',
                            ),
                            obscureText: !_showPassword,
                            onEditingComplete: () {
                              setState(() {
                                if (validatePassword(
                                    _passwordController.text)) {
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
                            child: Icon(_showPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,size: 18,))
                      ],
                    ),
                  ),
                ],
              ),
              if (!_passwordValidationPassed)
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      Strings.passwordError,
                      style: customTextStyle(
                          12, FontWeight.w400, AppColors.black5, 1.2),
                    )),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(Strings.forgotPassword,style: customTextStyleWithUnderline(16, FontWeight.w400, AppColors.blue1, 1),)),
              const SizedBox(height: 24,),
              ElevatedButton(
                style: registerBtnStyle,
                onPressed: () {
                
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
                        12, FontWeight.w400, AppColors.grey7, 1),
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
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.asset(google),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 51,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey8),
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.asset(apple),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 51,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey8),
                              borderRadius: BorderRadius.circular(5)),
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
                  style:
                      customTextStyle(16, FontWeight.w400, AppColors.black6, 1),
                  children: <TextSpan>[
                     TextSpan(text: Strings.dontHaveAnAccount),
                    TextSpan(
                        text: Strings.register,
                        style: customTextStyleWithUnderline(
                            16, FontWeight.w700, AppColors.black6, 1),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
