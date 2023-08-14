import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/repositories/user_profile_repository.dart';

class FollowUser {
  final UserProfileRepository repository;

  FollowUser(this.repository);

  Future<Either<Failure, Unit>> call(
      String currentUserId, String targetUserId) async {
    return await repository.followUser(currentUserId, targetUserId);
  }
}
