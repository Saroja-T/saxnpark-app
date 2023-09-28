part of 'landing_bloc.dart';

class LandingState extends Equatable {
  final int tabIndex;
  const LandingState({
    required this.tabIndex,
  });

  factory LandingState.initial() {
    return const LandingState(tabIndex: 0);
  }

  @override
  List<Object> get props => [tabIndex];

  @override
  String toString() => 'LandingState(tabIndex: $tabIndex)';

  LandingState copyWith({
    int? tabIndex
  }) {
    return LandingState(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}