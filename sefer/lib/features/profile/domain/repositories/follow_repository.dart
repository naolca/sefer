import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/follow.dart';

abstract class FollowRepository {
  Future<Either<Failure, bool>> isFollowing(
      String followerId, String followingId);
  Future<Either<Failure, List<Follow>>> getFollowers(String userId);
  Future<Either<Failure, List<Follow>>> getFollowing(String userId);
}
