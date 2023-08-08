import 'package:sefer/features/authentication/domain/entities/auth_result.dart';

class AuthResultModel extends AuthResult {
  AuthResultModel({required bool isSuccess}) : super(isSuccess: isSuccess);

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
