import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/repositories/user_profile_repository.dart';

class UnfollowUser {
  final UserProfileRepository repository;

  UnfollowUser(this.repository);

  Future<Either<Failure, Unit>> call(
      String currentUserId, String targetUserId) async {
    return await repository.unfollowUser(currentUserId, targetUserId);
  }
}
