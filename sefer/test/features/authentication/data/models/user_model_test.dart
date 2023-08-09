import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/authentication/data/models/user_model.dart';
import 'package:sefer/features/authentication/domain/entities/user_entity.dart';

void main() {
  final tUserModel = UserModel(
      userId: "1",
      username: "firaol",
      email: "firaol@gmail.com",
      profileImageUrl: "www.example.com",
      bio: "alpha",
      followersCount: 120,
      followingCount: 100);

  test("user models should be type of user entity", () async {
    expect(tUserModel, isA<User>());
  });

  group("from json", () {
    test("should return a user model when a json is parsed", () async {
      //arrange
      final Map<String, dynamic> jsonMap = {
        "userId": "1",
        "username": "firaol",
        "email": "firaol@gmail.com",
        "profileImageUrl": "www.example.com",
        "bio": "alpha",
        "followersCount": 120,
        "followingCount": 100
      };
      //act
      final result = UserModel.fromJson(jsonMap);

      //assert
      expect(result, tUserModel);
    });
  });

  group("to json", () {
    test("give a userModel, creates a json", () async {
      //act
      final result = tUserModel.toJson();
      //assert
      final expectedMap = {
        "userId": "1",
        "username": "firaol",
        "email": "firaol@gmail.com",
        "profileImageUrl": "www.example.com",
        "bio": "alpha",
        "followersCount": 120,
        "followingCount": 100
      };
      expect(result, expectedMap);
    });
  });
}
