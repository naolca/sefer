import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';
import 'package:sefer/features/profile/domain/entities/user_profile.dart';
import 'package:sefer/features/profile/domain/repositories/post_repository.dart';
import 'package:sefer/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:sefer/features/profile/domain/usecases/get_feed_posts.dart';
import 'package:sefer/features/profile/domain/usecases/get_posts_for_user.dart';
import 'package:sefer/features/profile/domain/usecases/get_user_profile.dart';
import 'package:sefer/features/profile/domain/usecases/like_post.dart';
import 'package:sefer/features/profile/domain/usecases/unlike_post.dart';
import 'get_posts_for_user_test.mocks.dart';

void main() {
  late MockPostRepository mockPostRepository;
  late UnlikePost usecase;

  setUp(() {
    mockPostRepository = MockPostRepository();
    usecase = UnlikePost(mockPostRepository);
  });

  test("should return a void(unit) upon a successfull like operation",
      () async {
    //arrange
    when(mockPostRepository.unlikePost(any, any))
        .thenAnswer((_) async => Right(unit));

    //act
    const tPostId = '1';
    const tUserId = '2';
    final result = await usecase(tPostId, tUserId);

    //assert
    expect(result, Right(unit));
    verify(mockPostRepository.unlikePost(tPostId, tUserId));
    verifyNoMoreInteractions(mockPostRepository);
  });

  test("should return failure upon failure being returned from the repo",
      () async {
    //arrange
    when(mockPostRepository.unlikePost(any, any))
        .thenAnswer((_) async => Left(ServerFailure()));

    //act
    const tPostId = '1';
    const tUserId = '2';
    final result = await usecase(tPostId, tUserId);

    //assert
    expect(result, Left(ServerFailure()));
    verify(mockPostRepository.unlikePost(tPostId, tUserId));
    verifyNoMoreInteractions(mockPostRepository);
  });
}
