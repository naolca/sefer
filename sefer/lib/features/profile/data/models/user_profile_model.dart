import 'package:sefer/features/profile/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    required String userId,
    required String username,
    required String email,
    required String profilePidtureUrl,
    required String bio,
    required int followersCount,
    required int followingCount,
    required int postsCount,
    required DateTime createdAt,
  }) : super(
          userId: userId,
          username: username,
          email: email,
          profilePictureUrl: profilePidtureUrl,
          bio: bio,
          followersCount: followersCount,
          followingCount: followingCount,
          postsCount: postsCount,
          createdAt: createdAt,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      profilePidtureUrl: json['profilePictureUrl'],
      bio: json['bio'],
      followersCount: json['followersCount'],
      followingCount: json['followingCount'],
      postsCount: json['postsCount'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'bio': bio,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'postsCount': postsCount,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
