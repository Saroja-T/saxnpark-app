part of 'location_bloc.dart';


// class LocationState extends Equatable {
//   final List<int> data;

//   const LocationState({
//     required this.data,
//   });

//   factory LocationState.initial() {
//     return LocationState(data: []);
//   }

//   @override
//   List<Object> get props => [];

//   LocationState copyWith({
//     List<int>? data,
//   }) {
//     return LocationState(
//       data: this.data,
      
//     );
//   } 
// }

sealed class LocationState extends Equatable {}

final class LocationInitial extends LocationState {
  final List<int> data = [];
  @override
  List<Object> get props => [data];
}

class LocationLoadedState extends LocationState {
  final List<int> data;

  LocationLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class LocationLoadingState extends LocationState {
  @override
  List<Object> get props => [];
}
