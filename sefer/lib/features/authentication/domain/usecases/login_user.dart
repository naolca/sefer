import 'package:dartz/dartz.dart';

import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/authentication/domain/entities/auth_result.dart';
import 'package:sefer/features/authentication/domain/repositories/authentication_repository.dart';

import '../entities/user_credentials.dart';

class LoginUser {
  final AuthenticationRepository authenticationRepository;

  LoginUser(this.authenticationRepository);

  Future<Either<Failure, AuthResult>> loginUser(
      UserCredentials userCredential) async {
    return await authenticationRepository.loginUser(userCredential);
  }
}
