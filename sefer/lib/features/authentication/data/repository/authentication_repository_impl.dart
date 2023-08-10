import 'package:flutter/foundation.dart';
import 'package:sefer/core/errors/exceptions.dart';
import 'package:sefer/features/authentication/data/models/auth_result_model.dart';
import 'package:sefer/features/authentication/domain/entities/user_credentials.dart';
import 'package:sefer/features/authentication/domain/entities/auth_result.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:sefer/features/authentication/domain/repositories/authentication_repository.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/authentication_local_data_source.dart';
import '../datasources/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticatonRemoteDataSource authenticatonRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;
  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl(
      {required this.authenticatonRemoteDataSource,
      required this.authenticationLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, AuthResult>> loginUser(
      UserCredentials credentials) async {
    final authResult = AuthResult(isSuccess: true);
    final authResultModel = AuthResultModel(isSuccess: true);
    if (await networkInfo.isConnected) {
      try {
        final result =
            await authenticatonRemoteDataSource.loginUser(credentials);
        if (result.isSuccess) {
          await authenticationLocalDataSource.cacheUser(authResultModel);
          return Right(authResult);
        } else {
          return Left(ServerFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await authenticationLocalDataSource.getUser();
        return Right(authResult);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<void> logoutUser() {
    return authenticationLocalDataSource.clearUser();
  }

  @override
  Future<Either<Failure, AuthResult>> registerUser(
      UserCredentials credentials) async {
    final authResult = AuthResult(isSuccess: true);
    try {
      authenticatonRemoteDataSource.registerUser(credentials);
      return Right(authResult);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
