part of 'landing_bloc.dart';

class LandingState extends Equatable {
  final int tabIndex;
  final String tabLabel;
  const LandingState({
    required this.tabIndex,
    required this.tabLabel,
  });

  factory LandingState.initial() {
    return LandingState(tabIndex: 0, tabLabel: Strings.home);
  }

  @override
  List<Object> get props => [tabIndex];

  @override
  String toString() => 'LandingState(tabIndex: $tabIndex)';

  LandingState copyWith({
    int? tabIndex,
    String? tabLabel
  }) {
    return LandingState(
      tabIndex: tabIndex ?? this.tabIndex,
      tabLabel: tabLabel ?? this.tabLabel,
    );
  }
}