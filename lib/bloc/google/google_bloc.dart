import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/authentication.dart';
part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  AuthRepository authRepository;
  GoogleBloc(
    this.authRepository,
  ) : super(GoogleState.initial()) {
    on<GoogleEvent>((event, emit) async {
      try {
        User? user = await authRepository.signInWithGoogle();
        print("UserEmail: ${user?.email}");
        emit(state.copyWith(googleUserName: user?.displayName, googleUserEmail: user?.email));
        
      } catch (e) {
       // emit(UserErrorState(e.toString()));
      }
    });
  }
}
