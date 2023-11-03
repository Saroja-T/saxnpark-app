import 'package:flutter/material.dart';
import 'package:saxnpark_app/pages/Authentication/login.dart';
import 'package:saxnpark_app/pages/Authentication/register.dart';
import 'package:saxnpark_app/pages/Authentication/register_home.dart';
import 'package:saxnpark_app/pages/home_page.dart';
import 'package:saxnpark_app/pages/landing_page.dart';
import 'package:saxnpark_app/pages/location_list.dart';
import 'package:saxnpark_app/pages/location_page.dart';


class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arg = settings.arguments;
    switch (settings.name) 
    {
      case '/':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/locationlist':
        return MaterialPageRoute(builder: (_) => const LocationList());
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
