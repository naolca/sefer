import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';
import 'package:sefer/features/profile/domain/repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.createPost(post);
  }
}
