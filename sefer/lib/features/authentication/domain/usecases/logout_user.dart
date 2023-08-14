import 'package:sefer/features/authentication/domain/repositories/authentication_repository.dart';

class LogoutUser {
  final AuthenticationRepository authenticationRepository;

  LogoutUser(this.authenticationRepository);

  Future<void> logout() {
    return authenticationRepository.logoutUser();
  }
}
