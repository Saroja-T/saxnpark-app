import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    print(">>>1");
    on<LoadMoreDataEvent>(mapLoadMoreDataToState);
  }

  Future<void> mapLoadMoreDataToState(event, emit) async {
    try {
      if (state is LocationInitial) {
        // Initial data loading
        emit(LocationLoadingState());
        List<int> newData = List.generate(20, (index) => index);
        print(">>>2:$newData");
        emit(LocationLoadedState(newData));
      } else if (state is LocationLoadedState) {
        // Additional data loading
        List<int> currentData = (state as LocationLoadedState).data;
        emit(LocationLoadingState());
        List<int> newData =
            List.generate(20, (index) => currentData.length + index);
        emit(LocationLoadedState([...currentData, ...newData]));
      }
    } catch (e) {
      print(">>>e:$e");
      // Handle error
      emit(LocationInitial());
    }
  }
}
