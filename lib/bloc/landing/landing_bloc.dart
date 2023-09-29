import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../utils/strings.dart';


part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingState.initial()) {
    on<TabChangeEvent>((event, emit) {
          emit(state.copyWith(tabIndex: event.tabIndex,tabLabel: event.tabLabel));
    });
    
  }
  
}
