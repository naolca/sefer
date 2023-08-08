import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userId;
  final String username;
  final String email;
  final String profileImageUrl;
  final String bio;
  final int followersCount;
  final int followingCount;

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.profileImageUrl,
    required this.bio,
    required this.followersCount,
    required this.followingCount,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        profileImageUrl,
        bio,
        followersCount,
        followingCount,
      ];
}
