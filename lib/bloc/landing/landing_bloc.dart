import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingState.initial()) {
    on<TabChangeEvent>((event, emit) {
          print(event.tabIndex);
          emit(state.copyWith(tabIndex: event.tabIndex));
    });
  }
}
