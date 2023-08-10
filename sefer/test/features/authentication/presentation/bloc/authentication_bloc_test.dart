import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/features/authentication/domain/entities/auth_result.dart';
import 'package:sefer/features/authentication/domain/entities/user_credentials.dart';
import 'package:sefer/features/authentication/domain/usecases/login_user.dart';
import 'package:sefer/features/authentication/domain/usecases/register_user.dart';
import 'package:sefer/features/authentication/domain/usecases/logout_user.dart';
import 'package:sefer/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'authentication_bloc_test.mocks.dart';

@GenerateMocks([LoginUser, RegisterUser, LogoutUser])
void main() {
  group('AuthenticationBloc', () {
    late AuthenticationBloc authenticationBloc;
    late MockLoginUser mockLoginUser;
    late MockRegisterUser mockRegisterUser;
    late MockLogoutUser mockLogoutUser;

    setUp(() {
      mockLoginUser = MockLoginUser();
      mockRegisterUser = MockRegisterUser();
      mockLogoutUser = MockLogoutUser();
      authenticationBloc =
          AuthenticationBloc(mockLoginUser, mockRegisterUser, mockLogoutUser);
    });

    tearDown(() {
      authenticationBloc.close();
    });

    test('initial state is AuthenticationInitial', () {
      expect(authenticationBloc.state, equals(AuthenticationInitial()));
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationLoading, AuthenticationAuthenticated] when AuthenticationEventLogin is added',
      build: () {
        when(mockLoginUser.loginUser(any))
            .thenAnswer((_) async => Right(AuthResult(isSuccess: true)));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(AuthenticationEventLogin(UserCredentials(
          identifier: 'user@example.com', password: 'password'))),
      expect: () => [AuthenticationLoading(), AuthenticationAuthenticated()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationLoading, AuthenticationRegistered] when AuthenticationEventRegister is added',
      build: () {
        when(mockRegisterUser.registerUser(any))
            .thenAnswer((_) async => Right(AuthResult(isSuccess: true)));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(AuthenticationEventRegister(UserCredentials(
          identifier: 'user@example.com', password: 'password'))),
      expect: () => [AuthenticationLoading(), AuthenticationRegistered()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationLoading, AuthenticationUnauthenticated] when AuthenticationEventLogout is added',
      build: () {
        when(mockLogoutUser.logout()).thenAnswer((_) async => Right(None()));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(AuthenticationEventLogout()),
      expect: () => [AuthenticationLoading(), AuthenticationUnauthenticated()],
    );
  });
}
