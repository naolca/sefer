import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/repositories/post_repository.dart';

class UnlikePost {
  final PostRepository repository;

  UnlikePost(this.repository);

  Future<Either<Failure, Unit>> call(String postId, String userId) async {
    return await repository.unlikePost(postId, userId);
  }
}
