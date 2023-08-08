import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class AuthResult extends Equatable {
  final bool isSuccess;
  final String? errorMessage;
  final User? user;

  AuthResult({
    required this.isSuccess,
    this.errorMessage,
    this.user,
  });

  @override
  List<Object?> get props => [isSuccess];
}
