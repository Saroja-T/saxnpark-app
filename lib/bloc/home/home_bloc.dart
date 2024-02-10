import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/custom_error.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) {
    });
  }

  FutureOr<void> _getBookingLocations(
     HomeEvent event,
    Emitter<HomeState> emit,
  ){
    emit(state.copyWith(status: HomeStatus.loading));
    // try {
    //   final LoginModel loginModel = await authRepository.logIn(event.phoneNumber,event.password);
    //   emit(state.copyWith(status: HomeStatus.loaded, loginModel: loginModel));
    // } on CustomError catch (e) {
    //   emit(state.copyWith(status: HomeStatus.error, error: e));
    // }
  }
}
