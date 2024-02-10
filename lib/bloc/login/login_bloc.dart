import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';
import '../../models/login_model.dart';
import '../../repositories/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({
    required this.authRepository,
  }) : super(LoginState.initial()) {
    on<LoginApiEvent>(_logIn);
  }

  FutureOr<void> _logIn(
    LoginApiEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading));
    try {
      final LoginModel loginModel = await authRepository.logIn(event.phoneNumber,event.password);
      emit(state.copyWith(status: SignInStatus.loaded, loginModel: loginModel));
    } on CustomError catch (e) {
      emit(state.copyWith(status: SignInStatus.error, error: e));
    }
  }
}
