import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/authentication/domain/usecases/login_user.dart';
import 'package:sefer/features/authentication/domain/usecases/register_user.dart';
import 'package:sefer/features/authentication/domain/usecases/logout_user.dart';

import '../../domain/entities/auth_result.dart';
import '../../domain/entities/user_credentials.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final LogoutUser logoutUser;

  AuthenticationBloc(this.loginUser, this.registerUser, this.logoutUser)
      : super(AuthenticationInitial()) {
    on<AuthenticationEventLogin>(_handleLogin);
    on<AuthenticationEventRegister>(_handleRegister);
    on<AuthenticationEventLogout>(_handleLogout);
  }

  void _handleLogin(
      AuthenticationEventLogin event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    final result = await loginUser.loginUser(event.credentials);

    emit(_handleLoginResult(result));
  }

  void _handleRegister(AuthenticationEventRegister event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    final result = await registerUser.registerUser(event.credentials);
    emit(_handleRegisterResult(result));
  }

  void _handleLogout(AuthenticationEventLogout event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    await logoutUser.logout();
    emit(AuthenticationUnauthenticated());
  }

  AuthenticationState _handleLoginResult(Either<Failure, AuthResult> result) {
    print(result);
    return result.fold(
      (error) => AuthenticationError("error"),
      (_) => AuthenticationAuthenticated(),
    );
  }

  AuthenticationState _handleRegisterResult(
      Either<Failure, AuthResult> result) {
    return result.fold(
      (error) => AuthenticationError("error"),
      (_) => AuthenticationRegistered(),
    );
  }

  AuthenticationState _handleLogoutResult(Either<Failure, Unit> result) {
    return result.fold(
      (_) => AuthenticationUnauthenticated(),
      (_) => AuthenticationUnauthenticated(),
    );
  }
}
