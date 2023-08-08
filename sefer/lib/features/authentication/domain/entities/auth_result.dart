import 'user_entity.dart';

class AuthResult {
  final bool isSuccess;
  final String? errorMessage;
  final User? user;

  AuthResult({
    required this.isSuccess,
    this.errorMessage,
    this.user,
  });
}
