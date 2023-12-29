part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent(); 
  @override
  List<Object> get props => [];
  
}
class LocationSearchEvent extends LocationEvent {
  final int locationSearch;
  const LocationSearchEvent({required this.locationSearch});
}



