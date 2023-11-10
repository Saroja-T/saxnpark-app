part of 'google_bloc.dart';

class GoogleState extends Equatable {
  final String? googleUserName;
  final String? googleUserEmail;
  const GoogleState({
    required this.googleUserName,
    required this.googleUserEmail,
  });

  factory GoogleState.initial(){
    return const GoogleState(googleUserName: '', googleUserEmail: '');
  } 
  @override
  List<Object> get props => [];

  GoogleState copyWith({
    required String? googleUserName,
    required String? googleUserEmail
  }) {
    return GoogleState(
      googleUserName: googleUserName,
      googleUserEmail: googleUserEmail,
    );
  }

  @override
  bool get stringify => true;

  }

