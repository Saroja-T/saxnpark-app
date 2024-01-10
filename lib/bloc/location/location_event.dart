part of 'location_bloc.dart';

// sealed class LocationEvent extends Equatable {
//   const LocationEvent();
//   @override
//   List<Object> get props => [];

// }
// class LocationSearchEvent extends LocationEvent {
//   final List<int> data;
//   const LocationSearchEvent({required this.data});
// }

abstract class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMoreDataEvent extends LocationEvent {}
