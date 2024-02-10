import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login_model.dart';
import '../utils/constants.dart';
import 'http_error_handler.dart';

class AuthenticationApiServices {
  final http.Client httpClient;
  AuthenticationApiServices({
    required this.httpClient,
  });

  Future<LoginModel> postLogin(String phoneNumber, String password) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kHost,
      path: '/api/location/',
    );

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final loginJson = json.decode(response.body);

      final LoginModel weather = LoginModel.fromJson(loginJson);

      return weather;
    } catch (e) {
      rethrow;
    }
  }
}