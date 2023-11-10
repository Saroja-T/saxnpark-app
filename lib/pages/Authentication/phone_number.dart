import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/bloc/google/google_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});
  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
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
        appBar: CustomAppBar(title: Strings.addPhoneNumber),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                // border: Border.all(color: AppColors.blue1),
                                color: AppColors.blue4),
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                Strings.phoneNumberNotes,
                                style: customTextStyle(
                                    12, FontWeight.w400, AppColors.grey7, 1.2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.emailId,
                                style: customTextStyle(
                                    18, FontWeight.w400, AppColors.black1, 1),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                context
                                        .watch<GoogleBloc>()
                                        .state
                                        .googleUserEmail ??
                                    '',
                                style: customTextStyle(
                                    18, FontWeight.w600, AppColors.grey, 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
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
                                    Navigator.pushNamed(
                                        context, '/countrylist');
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
                                      14, FontWeight.w400, AppColors.black5, 1),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: TextField(
                                    controller: _phoneController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '908 612 422',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.grey10)),
                                    onEditingComplete: () {
                                      setState(() {
                                        if (_phoneController.text.length >=
                                            10) {
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
                          if (!_numberValidationPassed)
                            Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  Strings.numberError,
                                  style: customTextStyle(12, FontWeight.w400,
                                      AppColors.black5, 1.2),
                                )),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: registerBtnStyle,
                        onPressed: () {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 0, tabLabel: Strings.rHome));
                          Navigator.pushReplacementNamed(
                              context, '/landingpage');
                        },
                        child: Text(
                          Strings.continueBtn,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ])))));
  }
}
