import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/user_profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfile>> getUserProfile(String userId);
  Future<Either<Failure, Unit>> updateUserProfile(UserProfile userProfile);
  Future<Either<Failure, Unit>> followUser(
      String currentUserId, String targetUserId);
  Future<Either<Failure, Unit>> unfollowUser(
      String currentUserId, String targetUserId);
}
