import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';

import '../entities/auth_result.dart';
import '../entities/user_credentials.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthResult>> registerUser(UserCredentials credentials);
  Future<Either<Failure, AuthResult>> loginUser(UserCredentials credentials);
  Future<void> logoutUser();
}
