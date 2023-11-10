import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../repositories/authentication.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

  List<String> scopes = const <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  GoogleSignIn googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false;
  String _contactText = '';

  @override
  void initState() {
    super.initState();

    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool isAuthorized = account != null;
      // However, in the web...
      if (kIsWeb && account != null) {
        isAuthorized = await googleSignIn.canAccessScopes(scopes);
      }

      setState(() {
        _currentUser = account;
        _isAuthorized = isAuthorized;
      });

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      if (isAuthorized) {
        unawaited(_handleGetContact(account!));
      }
    });

    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    googleSignIn.signInSilently();
  }

// Calls the People API REST endpoint for the signed-in user to retrieve information.
  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
        (dynamic name) =>
            (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      // User is signed in, you can access the user's information
      print('User ID: ${googleUser.id}');
      print('Display Name: ${googleUser.displayName}');
      print('Email: ${googleUser.email}');
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
        appBar: CustomAppBarWithBack(
            title: Strings.register, backText: Strings.back),
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
                                        fontSize: 14, color: AppColors.grey10)),
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
                                _showConfirmPassword = !_showConfirmPassword;
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
              termsAndConditionText(context),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                style: registerBtnStyle,
                onPressed: () {},
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
              InkWell(
                onTap: () async{
                  User? user = await AuthRepository().signInWithGoogle();
                        print("Email:${user!.email}");
                        print("Name:${user!.displayName}");
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
                  style:
                      customTextStyle(16, FontWeight.w400, AppColors.black6, 1),
                  children: <TextSpan>[
                    TextSpan(text: Strings.alreadyHaveAccount),
                    TextSpan(
                        text: Strings.signin,
                        style: customTextStyleWithUnderline(
                            16, FontWeight.w700, AppColors.black6, 1),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, '/login');
                          }),
                  ],
                ),
              ),
            ]),
          ),
        )));
  }

  Widget termsAndConditionText(BuildContext context) {
    TextStyle defaultStyle = customTextStyle(
      14,
      FontWeight.w400,
      AppColors.black5,
      1.2,
    );
    TextStyle linkStyle =
        customTextStyleWithUnderline(14, FontWeight.w400, AppColors.blue1, 1);
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
