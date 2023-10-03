part of 'home_bloc.dart';

enum HomeStatus{
  initial,
  loading,
  loaded,
  error
}
class HomeState extends Equatable {
  final HomeStatus status;
  HomeState({
    required this.status
  });

  factory HomeState.initial() {
    return HomeState(
      status: HomeStatus.initial
    );
  }
  @override
  List<Object> get props => [];

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}

