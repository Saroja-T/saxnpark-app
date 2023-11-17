import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/google/google_bloc.dart';
import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';


class NewPassword extends StatefulWidget {
  const NewPassword({super.key});
  @override
  State<NewPassword> createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _passwordValidationPassed = true;
  bool _confirmPasswordValidationPassed = true;

  String tabLabel = "";
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
        appBar: CustomAppBarWithBack(
            title: Strings.passwordReset, backText: Strings.back),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Strings.createNewPassword,
                  style: customTextStyle(
                      20, FontWeight.w500, AppColors.black1, 1),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  Strings.enterNewPassword ,
                  style: customTextStyle(
                      16, FontWeight.w400, AppColors.black5, 1.2),
                ),
                const SizedBox(
                  height: 26,
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
                              hintStyle: TextStyle(
                                  fontSize: 14, color: AppColors.grey10)),
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
                          child: Icon(
                            _showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 18,
                            color: AppColors.black5,
                          ))
                    ],
                  ),
                ),
              ],
            ),
            // if (!_passwordValidationPassed)
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  Strings.passwordError,
                  style: customTextStyle(
                      12, FontWeight.w400, AppColors.black5, 1.2),
                )),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.confirmPassword,
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
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Strings.enterPassword,
                              hintStyle: TextStyle(
                                  fontSize: 14, color: AppColors.grey10)),
                          obscureText: !_showConfirmPassword,
                          onEditingComplete: () {
                            setState(() {
                              if (_confirmPasswordController.text ==
                                  _passwordController.text) {
                                _confirmPasswordValidationPassed = true;
                              } else {
                                _confirmPasswordValidationPassed = false;
                              }
                            });
                          },
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _showConfirmPassword =
                                  !_showConfirmPassword;
                            });
                          },
                          child: Icon(
                            _showConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 18,
                            color: AppColors.black5,
                          ))
                    ],
                  ),
                ),
              ],
            ),
            if (!_confirmPasswordValidationPassed)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      Strings.confirmPasswordError,
                      style: customTextStyle(
                          12, FontWeight.w400, AppColors.black5, 1.2),
                    )),
              ),
            const SizedBox(height: 24),

            ElevatedButton(
              style: registerBtnStyle,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/generalHome', (route) => false);
              },
              child: Text(
                Strings.resetPassword,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ]),
        )));
  }
}
