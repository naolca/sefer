import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/comment.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<Comment>>> getCommentsForPost(String postId);
  Future<Either<Failure, Unit>> addComment(Comment comment);
  Future<Either<Failure, Unit>> deleteComment(String commentId);
}
