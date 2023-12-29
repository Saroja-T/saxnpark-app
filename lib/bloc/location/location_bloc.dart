import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState.initial()) {
    on<LocationSearchEvent>((event, emit) {
          emit(state.copyWith(locationSearch: event.locationSearch));
    });
    
  }
  
}