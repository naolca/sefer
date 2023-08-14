import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/user_profile.dart';
import 'package:sefer/features/profile/domain/repositories/user_profile_repository.dart';

class UpdateUserProfile {
  final UserProfileRepository repository;

  UpdateUserProfile(this.repository);

  Future<Either<Failure, Unit>> call(UserProfile userProfile) async {
    return await repository.updateUserProfile(userProfile);
  }
}
