import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';
import 'package:sefer/features/profile/domain/repositories/post_repository.dart';
import 'package:sefer/features/profile/domain/usecases/create_post.dart';
import 'create_post_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  late MockPostRepository mockPostRepository;
  late CreatePost usecase;

  setUp(() {
    mockPostRepository = MockPostRepository();
    usecase = CreatePost(mockPostRepository);
  });

  final testPost = Post(
    postId: '1',
    userId: '1',
    imageUrl: 'www.example.com',
    caption: "me studying",
    timestamp: DateTime.now(),
  );

  test('should create a post from the repository', () async {
    // Arrange
    when(mockPostRepository.createPost(any))
        .thenAnswer((_) async => Right(unit));

    // Act
    final result = await usecase(testPost);

    // Assert
    expect(result, Right(unit));
    verify(mockPostRepository.createPost(testPost));
    verifyNoMoreInteractions(mockPostRepository);
  });

  test("should return a failure when the repo returns a failure", () async {
    //arrange
    when(mockPostRepository.createPost(any))
        .thenAnswer((_) async => Left(ServerFailure()));

    //act
    final result = await usecase(testPost);

    //assert
    expect(result, Left(ServerFailure()));
    verify(mockPostRepository.createPost(testPost));
    verifyNoMoreInteractions(mockPostRepository);
  });
}
