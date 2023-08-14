import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String userId;
  final String username;
  final String email;
  final String profilePictureUrl;
  final String bio;
  final int followersCount;
  final int followingCount;
  final int postsCount;
  final DateTime createdAt;

  UserProfile({
    required this.userId,
    required this.username,
    required this.email,
    required this.profilePictureUrl,
    required this.bio,
    required this.followersCount,
    required this.followingCount,
    required this.postsCount,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [userId];

  @override
  bool get stringify => true;
}
