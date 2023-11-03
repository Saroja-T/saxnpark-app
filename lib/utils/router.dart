import 'package:flutter/material.dart';
import 'package:saxnpark_app/pages/landing_page.dart';
import 'package:saxnpark_app/pages/locations/location_list.dart';


class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arg = settings.arguments;
    switch (settings.name) 
    {
      case '/':
        return MaterialPageRoute(builder: (_) => const LandingPage());
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
