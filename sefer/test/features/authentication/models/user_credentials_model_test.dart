import 'package:sefer/features/authentication/data/models/user_credentials_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/authentication/domain/entities/user_credentials.dart';

void main() {
  final tUserCredentialsModel =
      UserCredentialsModel(identifier: "firaol", password: "password");

  test("user credentials model should be type of user credentials entity",
      () async {
    expect(tUserCredentialsModel, isA<UserCredentials>());
  });

  group("from json", () {
    test("should return a usercredential model when a json is parsed",
        () async {
      //arrange
      final Map<String, dynamic> jsonMap = {
        "identifier": "firaol",
        "password": "password"
      };
      //act
      final result = UserCredentialsModel.fromJson(jsonMap);

      //assert

      expect(result, equals(tUserCredentialsModel));
    });
  });

  group("to json", () {
    test("given a usercredentialModel, it returns the json version", () async {
      //act
      final result = tUserCredentialsModel.toJson();
      //assert
      final expectedMap = {"identifier": "firaol", "password": "password"};
      expect(result, expectedMap);
    });
  });
}
