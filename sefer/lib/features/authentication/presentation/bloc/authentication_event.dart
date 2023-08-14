part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationEventLogin extends AuthenticationEvent {
  final UserCredentials credentials;

  AuthenticationEventLogin(this.credentials);

  @override
  List<Object> get props => [credentials];
}

class AuthenticationEventRegister extends AuthenticationEvent {
  final UserCredentials credentials;

  AuthenticationEventRegister(this.credentials);

  @override
  List<Object> get props => [credentials];
}

class AuthenticationEventLogout extends AuthenticationEvent {}
