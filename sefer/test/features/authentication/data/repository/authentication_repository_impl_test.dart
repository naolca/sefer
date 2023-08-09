import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/exceptions.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/core/platform/network_info.dart';
import 'package:sefer/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:sefer/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:sefer/features/authentication/data/models/auth_result_model.dart';
import 'package:sefer/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:sefer/features/authentication/domain/entities/auth_result.dart';
import 'package:sefer/features/authentication/domain/entities/user_credentials.dart';
import 'package:sefer/features/authentication/domain/entities/user_entity.dart';

import 'authentication_repository_impl_test.mocks.dart';

@GenerateMocks([
  AuthenticatonRemoteDataSource,
  AuthenticationLocalDataSource,
  NetworkInfo,
])
void main() {
  // Your test code here
  late AuthenticationRepositoryImpl repository;
  late MockAuthenticatonRemoteDataSource mockAuthenticatonRemoteDataSource;
  late MockAuthenticationLocalDataSource mockAuthenticationLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthenticatonRemoteDataSource = MockAuthenticatonRemoteDataSource();
    mockAuthenticationLocalDataSource = MockAuthenticationLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = AuthenticationRepositoryImpl(
      authenticatonRemoteDataSource: mockAuthenticatonRemoteDataSource,
      authenticationLocalDataSource: mockAuthenticationLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("login user", () {
    test("checks the connection when login in", () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // Act
      const identifier = "firaol";
      const password = "123456";
      final credentials =
          UserCredentials(identifier: identifier, password: password);
      when(mockAuthenticatonRemoteDataSource.loginUser(credentials))
          .thenAnswer((_) async => AuthResultModel(isSuccess: true));
      final result = await repository.loginUser(credentials);

      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      const identifier = "firaol";
      const password = "123456";
      final credentials =
          UserCredentials(identifier: identifier, password: password);
      final authResult = AuthResult(isSuccess: true);

      test(
          "should return the user entity when the login is initiated and is succesful",
          () async {
        when(mockAuthenticatonRemoteDataSource.loginUser(credentials))
            .thenAnswer((_) async => AuthResultModel(isSuccess: true));

        final result = await repository.loginUser(credentials);
        verify(mockAuthenticatonRemoteDataSource.loginUser(credentials));
        expect(result, equals(Right(authResult)));
      });

      test("should cache the user data after a succesfull login", () async {
        when(mockAuthenticatonRemoteDataSource.loginUser(credentials))
            .thenAnswer((_) async => AuthResultModel(isSuccess: true));

        await repository.loginUser(credentials);
        verify(mockAuthenticatonRemoteDataSource.loginUser(credentials));
        verify(mockAuthenticationLocalDataSource.cacheUser());
      });

      test(
          "should return server fauilure when the call to remote database is not successful",
          () async {
        when(mockAuthenticatonRemoteDataSource.loginUser(credentials))
            .thenThrow(ServerException());

        final result = await repository.loginUser(credentials);

        verifyZeroInteractions(mockAuthenticationLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group("device is offline", () {
      const identifier = "firaol";
      const password = "123456";
      final credentials =
          UserCredentials(identifier: identifier, password: password);
      final authResult = AuthResult(isSuccess: true);
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
          "Should return the cached user data, if any,  when there is no internet connection",
          () async {
        //assert
        when(mockAuthenticationLocalDataSource.getUser())
            .thenAnswer((_) async => AuthResultModel(isSuccess: true));
        //act
        final result = await repository.loginUser(credentials);

        //assert
        verifyZeroInteractions(mockAuthenticatonRemoteDataSource);
        verify(mockAuthenticationLocalDataSource.getUser());
        expect(result, equals(Right(authResult)));
      });

      test(
          "Should return the cached user data, if any,  when there is no internet connection",
          () async {
        //assert
        when(mockAuthenticationLocalDataSource.getUser())
            .thenAnswer((_) async => AuthResultModel(isSuccess: true));
        //act
        final result = await repository.loginUser(credentials);

        //assert
        verifyZeroInteractions(mockAuthenticatonRemoteDataSource);
        verify(mockAuthenticationLocalDataSource.getUser());
        expect(result, equals(Right(authResult)));
      });

      test("should return cache failure when their is no user cached",
          () async {
        //arrange
        when(mockAuthenticationLocalDataSource.getUser())
            .thenThrow(CacheException());

        //act
        final result = await repository.loginUser(credentials);

        //assert
        verifyZeroInteractions(mockAuthenticatonRemoteDataSource);
        verify(mockAuthenticationLocalDataSource.getUser());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

/////testes for the register user function
  ///
  ///
  ///
  group('register user', () {
    const identifier = "firaol";
    const password = "123456";
    final credentials =
        UserCredentials(identifier: identifier, password: password);
    final authResult = AuthResult(isSuccess: true);
    test(
        "should register user when the user fills all the necessary data and is succesfully registered",
        () async {
      //arrange

      when(mockAuthenticatonRemoteDataSource.registerUser(credentials))
          .thenAnswer((_) async => AuthResultModel(isSuccess: true));

      //act
      final result = await repository.registerUser(credentials);

      //assert
      verify(mockAuthenticatonRemoteDataSource.registerUser(credentials));
      expect(result, equals(Right(authResult)));
    });

    test("should return server Failure when the server returns an error",
        () async {
      //arrange
      when(mockAuthenticatonRemoteDataSource.registerUser(credentials))
          .thenThrow(ServerException());

      //act
      final result = await repository.registerUser(credentials);

      //assert
      verify(mockAuthenticatonRemoteDataSource.registerUser(credentials));
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group('logout user', () {
    test("should should clear the cached user data when the user ", () async {
      //arrange

      //act
      final result = await repository.logoutUser();

      //assert
      verify(mockAuthenticationLocalDataSource.clearUser());
    });
  });
}
