import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/profile/data/models/user_profile_model.dart';
import 'package:sefer/features/profile/domain/entities/user_profile.dart';

void main() {
  final userProfileModel = UserProfileModel(
      userId: '1',
      username: 'alpha',
      email: "alpha@gmail.com",
      profilePidtureUrl: "www.example.com",
      bio: "unique",
      followersCount: 100,
      followingCount: 150,
      postsCount: 20,
      createdAt: DateTime(2022));

  group('User profile Model', () {
    test("should be type of user Profile Entity", () async {
      //assert
      expect(userProfileModel, isA<UserProfile>());
    });

    test("should convert to JSON and from JSON", () async {
      //arrange

      //act
      final json = userProfileModel.toJson();
      final fromJson = UserProfileModel.fromJson(json);

      //assert
      expect(json, isA<Map<String, dynamic>>());
      expect(fromJson, equals(userProfileModel));
    });
  });
}
