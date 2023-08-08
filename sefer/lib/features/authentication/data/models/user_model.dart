import '../../domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({
    required userId,
    required username,
    required email,
    required profileImageUrl,
    required bio,
    required followersCount,
    required followingCount,
  }) : super(
            userId: userId,
            username: username,
            email: email,
            profileImageUrl: profileImageUrl,
            bio: bio,
            followersCount: followersCount,
            followingCount: followingCount);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json["username"],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
      bio: json['bio'],
      followersCount: json["followersCount"],
      followingCount: json['followingCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "username": username,
      "email": email,
      "profileImageUrl": profileImageUrl,
      "bio": bio,
      "followersCount": followersCount,
      "followingCount": followingCount,
    };
  }
}
