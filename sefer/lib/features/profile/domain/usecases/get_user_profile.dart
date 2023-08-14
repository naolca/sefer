import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/user_profile.dart';
import 'package:sefer/features/profile/domain/repositories/user_profile_repository.dart';

class GetUserProfile {
  final UserProfileRepository repository;

  GetUserProfile(this.repository);

  Future<Either<Failure, UserProfile>> call(String userId) async {
    return await repository.getUserProfile(userId);
  }
}
