part of 'landing_bloc.dart';

sealed class LandingEvent extends Equatable {
  const LandingEvent(); 
  @override
  List<Object> get props => [];
  
}
class TabChangeEvent extends LandingEvent {
  final int tabIndex;
  final String tabLabel;
  const TabChangeEvent({required this.tabIndex,required this.tabLabel});
}


