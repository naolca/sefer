import 'package:sefer/features/authentication/domain/entities/auth_result.dart';

import '../../domain/entities/user_entity.dart';

class AuthResultModel extends AuthResult {
  final String? errorMessage;
  final User? user;
  AuthResultModel({
    required bool isSuccess,
    this.errorMessage,
    this.user,
  }) : super(isSuccess: isSuccess);

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    return AuthResultModel(
      isSuccess: json['isSuccess'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': isSuccess,
    };
  }
}
