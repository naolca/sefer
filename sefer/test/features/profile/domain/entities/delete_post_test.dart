import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';
import 'package:sefer/features/profile/domain/repositories/post_repository.dart';
import 'package:sefer/features/profile/domain/usecases/create_post.dart';
import 'package:sefer/features/profile/domain/usecases/delete_post.dart';
import 'create_post_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  late MockPostRepository mockPostRepository;
  late DeletePost usecase;

  const tPostId = '1';
  setUp(() {
    mockPostRepository = MockPostRepository();
    usecase = DeletePost(mockPostRepository);
  });

  test('should create a post from the repository', () async {
    // Arrange
    when(mockPostRepository.deletePost(any))
        .thenAnswer((_) async => Right(unit));

    // Act
    final result = await usecase(tPostId);

    // Assert
    expect(result, Right(unit));
    verify(mockPostRepository.deletePost(tPostId));
    verifyNoMoreInteractions(mockPostRepository);
  });

  test("should return a failure when the repo returns a failure", () async {
    //arrange
    when(mockPostRepository.deletePost(any))
        .thenAnswer((_) async => Left(ServerFailure()));

    //act
    final result = await usecase(tPostId);

    //assert
    expect(result, Left(ServerFailure()));
    verify(mockPostRepository.deletePost(tPostId));
    verifyNoMoreInteractions(mockPostRepository);
  });
}
