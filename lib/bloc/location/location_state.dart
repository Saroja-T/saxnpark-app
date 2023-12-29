part of 'location_bloc.dart';


class LocationState extends Equatable {
  final int locationSearch;

  const LocationState({
    required this.locationSearch,
  });

  factory LocationState.initial() {
    return LocationState(locationSearch: 0);
  }

  @override
  List<Object> get props => [locationSearch];

  @override
  String toString() => 'LocationState(tabIndex: $locationSearch)';

  LocationState copyWith({
    int? locationSearch,
  }) {
    return LocationState(
      locationSearch: locationSearch ?? this.locationSearch,
      
    );
  } 
}

