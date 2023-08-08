import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/authentication/domain/entities/auth_result.dart';
import 'package:sefer/features/authentication/domain/repositories/authentication_repository.dart';

class RegisterUser {
  final AuthenticationRepository authenticationRepository;

  RegisterUser(this.authenticationRepository);

  Future<Either<Failure, AuthResult>> registerUser(userCredentials) async {
    return await authenticationRepository.registerUser(userCredentials);
  }
}
