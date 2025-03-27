part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState{}

final class LoginInitial extends LoginState {}

final class LoginSuccessful extends LoginActionState{}

final class LoginFailed extends LoginActionState{}