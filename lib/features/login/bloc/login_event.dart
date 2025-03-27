part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonClickedEvent extends LoginEvent {
  final String username;
  final String password;

  LoginButtonClickedEvent({
    required this.username,
    required this.password,
  });
}
