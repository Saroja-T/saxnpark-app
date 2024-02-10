part of 'login_bloc.dart';

enum SignInStatus {
  initial,
  loading,
  loaded,
  error,
}

class LoginState extends Equatable {
  final SignInStatus status;
  final LoginModel loginModel;
  final CustomError error;
  const LoginState({
    required this.status,
    required this.loginModel,
    required this.error,
  });

  factory LoginState.initial() {
    return LoginState(
      status: SignInStatus.initial,
      loginModel: LoginModel.initial(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, loginModel, error];

  @override
  bool get stringify => true;

  LoginState copyWith({
    SignInStatus? status,
    LoginModel? loginModel,
    CustomError? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginModel: loginModel ?? this.loginModel,
      error: error ?? this.error,
    );
  }
}
