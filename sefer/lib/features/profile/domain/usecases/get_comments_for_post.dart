import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/comment.dart';
import 'package:sefer/features/profile/domain/repositories/comment_repository.dart';

class GetCommentsForPost {
  final CommentRepository repository;

  GetCommentsForPost(this.repository);

  Future<Either<Failure, List<Comment>>> call(String postId) async {
    return await repository.getCommentsForPost(postId);
  }
}
