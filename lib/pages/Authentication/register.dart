import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/bloc/google/google_bloc.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../utils/validations.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _numberValidationPassed = true;
  bool _emptyPasswordValidationPassed = false;
  bool _passwordValidationPassed = false;
  bool _confirmPasswordValidationPassed = true;
  bool _emptyConfirmPasswordValidation = false;
  bool? _initialScreen;

  String tabLabel = "";
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  Validations validate = Validations();

  @override
  void initState() {
    super.initState();
    _initialScreen = true;
    Strings.shouldRedirectToHome = false;
  }

  void validateFeilds() {
    // Phone number validation
    _numberValidationPassed = _phoneController.text.isNotEmpty;

    // Password validations
    _emptyPasswordValidationPassed = _passwordController.text.isEmpty;
    _emptyConfirmPasswordValidation = _confirmPasswordController.text.isEmpty;
    _passwordValidationPassed = _passwordController.text.isNotEmpty &&
        validate.validatePassword(_passwordController.text);
    _confirmPasswordValidationPassed =
        _passwordController.text == _confirmPasswordController.text;

    // Check if all validations passed
    bool allValidationsPassed = _numberValidationPassed &&
        !_emptyPasswordValidationPassed &&
        !_emptyConfirmPasswordValidation &&
        _passwordValidationPassed &&
        _confirmPasswordValidationPassed;

    if (allValidationsPassed) {
      // Call your API function here
      callYourAPIFunction();
    } else {
      // Handle the case where not all validations passed
      // You may display an error message to the user or take appropriate action.
    }
  }

  void callYourAPIFunction() {
    // Replace this with your actual API call implementation
    print('Calling API...');
    // Your API call logic goes here
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return BlocConsumer<GoogleBloc, GoogleState>(
      listener: (context, state) {
        if (state.googleUserEmail != '') {
          print("mail123");
          Navigator.pushReplacementNamed(context, '/phonenumber');
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBarWithBack(
                title: Strings.register, backText: Strings.back),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                child: Column(children: [
                  if(Strings.isAccountDeleted)
                  NotificationBanner(
                    message: Strings.accountDeleted,
                    isCancelAvailable:false,
                    isErrorMsg: false,
                    onCancel: () {
                      setState(() {
                        Strings.isAccountDeleted = false;
                      });
                    },
                  ),
                  if(Strings.isAccountDeleted)
                  const SizedBox(
                    height: 24,
                  ),
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
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '908 612 422',
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
                                onChanged: (val) {
                                  setState(() {
                                    _initialScreen = false;
                                    if (validate.validatePassword(
                                        _passwordController.text)) {
                                      _passwordValidationPassed = true;
                                    } else {
                                      _confirmPasswordValidationPassed = true;
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
                  passwordRegexHint(),
                  // if (!_passwordValidationPassed)
                  if (_passwordValidationPassed)
                    errorWidget(Strings.passwordIncorrect),
                  if (_emptyPasswordValidationPassed)
                    errorWidget(Strings.emptyPasswordError),
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
                                onChanged: (val) {
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
                    errorWidget(Strings.confirmPasswordError),
                  if (_emptyConfirmPasswordValidation)
                    errorWidget(Strings.emptyPasswordError),

                  const SizedBox(height: 24),
                  termsAndConditionText(context),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    style: registerBtnStyle,
                    onPressed: () {
                      setState(() {
                        _initialScreen = false;
                        validateFeilds();
                      });
                    },
                    child: Text(
                      Strings.register,
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
                        Strings.registerWith,
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
                  InkWell(
                    onTap: () async {
                      context.read<GoogleBloc>().add(const GoogleEvent());
                    },
                    child: Container(
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
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RichText(
                    text: TextSpan(
                      style: customTextStyle(
                          16, FontWeight.w400, AppColors.black6, 1),
                      children: <TextSpan>[
                        TextSpan(text: Strings.alreadyHaveAccount),
                        TextSpan(
                            text: Strings.signin,
                            style: customTextStyleWithUnderline(
                              16,
                              FontWeight.w700,
                              AppColors.black6,
                              1,
                              AppColors.black6,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              }),
                      ],
                    ),
                  ),
                ]),
              ),
            )));
      },
    );
  }

  Widget termsAndConditionText(BuildContext context) {
    TextStyle defaultStyle = customTextStyle(
      14,
      FontWeight.w400,
      AppColors.black5,
      1.2,
    );
    TextStyle linkStyle = customTextStyleWithUnderline(
        14, FontWeight.w400, AppColors.blue1, 1, AppColors.blue1);
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: Strings.termsAndConditionText),
          TextSpan(
              text: Strings.termsAndConditions,
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = () {}),
          TextSpan(text: Strings.and),
          TextSpan(
              text: Strings.privacyPolicy,
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );
  }
}
