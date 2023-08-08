import 'package:sefer/features/authentication/domain/entities/user_credentials.dart';

class UserCredentialsModel extends UserCredentials {
  UserCredentialsModel({
    required String identifier,
    required String password,
  }) : super(
          identifier: identifier,
          password: password,
        );

  factory UserCredentialsModel.fromJson(Map<String, dynamic> json) {
    return UserCredentialsModel(
        identifier: json["identifier"], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      "identifier": identifier,
      "password": password,
    };
  }
}
