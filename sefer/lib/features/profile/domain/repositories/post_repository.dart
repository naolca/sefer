import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPostsForUser(String userId);
  Future<Either<Failure, List<Post>>> getFeedPosts(String userId);
  Future<Either<Failure, Unit>> createPost(Post post);
  Future<Either<Failure, Unit>> deletePost(String postId);
  Future<Either<Failure, Unit>> likePost(String postId, String userId);
  Future<Either<Failure, Unit>> unlikePost(String postId, String userId);
}
