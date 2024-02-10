import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String statusCode;
  final String message;
  final String data;
  const LoginModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final loginJson = json;

    return LoginModel(
      statusCode: loginJson['status_code'],
      message: loginJson['message'],
      data: loginJson['data'],
    );
  }

  factory LoginModel.initial() => const LoginModel(
        statusCode: '',
        message: '',
        data: '',
      );

  @override
  List<Object> get props {
    return [
      statusCode,
      message,
      data,
    ];
  }

  @override
  bool get stringify => true;
}