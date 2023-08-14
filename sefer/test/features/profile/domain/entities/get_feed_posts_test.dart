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
import 'get_posts_for_user_test.mocks.dart';

void main() {
  late MockPostRepository mockPostRepository;
  late GetFeedPosts usecase;

  setUp(() {
    mockPostRepository = MockPostRepository();
    usecase = GetFeedPosts(mockPostRepository);
  });

  test(
      "should return a list of posts for the feed when the repo returns a list of posts",
      () async {
    //arrange
    Post tPost_1 = Post(
        postId: '1',
        userId: '1',
        imageUrl: 'www.example.com',
        caption: "me studying",
        timestamp: DateTime.now());
    Post tPost_2 = Post(
        postId: '2',
        userId: '1',
        imageUrl: 'www.example.com',
        caption: "me eating",
        timestamp: DateTime.now());

    List<Post> tListPost = [tPost_1, tPost_2];
    final userId = '1';
    when(mockPostRepository.getFeedPosts(userId))
        .thenAnswer((_) async => Right(tListPost));

    //act
    final result = await usecase(userId);

    //assert
    expect(result, Right(tListPost));
    verify(mockPostRepository.getFeedPosts(userId));
    verifyNoMoreInteractions(mockPostRepository);
  });

  test("should return a failure upon the repo returning a failure", () async {
    //arrange
    final userId = '1';
    when(mockPostRepository.getFeedPosts(userId))
        .thenAnswer((_) async => Left(ServerFailure()));

    //act
    final result = await usecase(userId);

    //assert
    expect(result, Left(ServerFailure()));
    verify(mockPostRepository.getFeedPosts(userId));
    verifyNoMoreInteractions(mockPostRepository);
  });
}
