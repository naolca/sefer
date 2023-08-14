import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';
import 'package:sefer/features/profile/domain/repositories/post_repository.dart';

class GetFeedPosts {
  final PostRepository repository;

  GetFeedPosts(this.repository);

  Future<Either<Failure, List<Post>>> call(String userId) async {
    return await repository.getFeedPosts(userId);
  }
}
