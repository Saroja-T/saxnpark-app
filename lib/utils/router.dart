import 'package:flutter/material.dart';
import 'package:saxnpark_app/pages/Authentication/password_reset.dart';
import 'package:saxnpark_app/pages/authentication/country_list.dart';
import 'package:saxnpark_app/pages/authentication/otp_verification.dart';
import 'package:saxnpark_app/pages/authentication/phone_number.dart';
import 'package:saxnpark_app/pages/authentication/register.dart';
import 'package:saxnpark_app/pages/authentication/register_home.dart';
import 'package:saxnpark_app/pages/landing_page.dart';

import '../pages/authentication/new_password.dart';
import '../pages/locations/location_list.dart';
import '../pages/authentication/login.dart';


class RoutesGenerator 
{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arg = settings.arguments;
    switch (settings.name) 
    {
      case '/':
        return MaterialPageRoute(builder: (_) => const PasswordReset());
      case '/locationlist':
        return MaterialPageRoute(builder: (_) => const LocationList());
      case '/registerhome':
        return MaterialPageRoute(builder: (_) => const RegisterHome());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/countrylist':
        return MaterialPageRoute(builder: (_) => const CountryList());
      case '/landingpage':
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case '/phonenumber':
        return MaterialPageRoute(builder: (_) => const PhoneNumber());
      case '/passwordreset':
        return MaterialPageRoute(builder: (_)=> const PasswordReset());
      case '/otpVerification':
        return MaterialPageRoute(builder: (_)=> const OTPVerification());
      case '/newPassword':
      return MaterialPageRoute(builder: (_) => const NewPassword());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
