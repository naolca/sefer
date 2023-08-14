part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationRegistered extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class UserLoggedOut extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String errorMessage;

  AuthenticationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
