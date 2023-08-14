import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/user_profile.dart';
import 'package:sefer/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:sefer/features/profile/domain/usecases/get_user_profile.dart';
import 'package:sefer/features/profile/domain/usecases/update_user_profile.dart';
import 'get_user_profile_test.mocks.dart';

@GenerateMocks([UserProfileRepository]) // Generated mocks

void main() {
  // Mock repository
  late MockUserProfileRepository mockUserProfileRepository;

  // Use case
  late UpdateUserProfile usecase;

  final userId = '1';
  final userProfile = UserProfile(
    userId: userId,
    bio: 'alpha',
    createdAt: DateTime.now(),
    email: 'firaol@gmail.com',
    followersCount: 10,
    followingCount: 120,
    postsCount: 20,
    profilePictureUrl: 'www.example.com',
    username: 'alpha',

    /* other properties */
  );
  setUp(() {
    mockUserProfileRepository = MockUserProfileRepository();

    usecase = UpdateUserProfile(mockUserProfileRepository);
  });

  test('should get user profile from the repository', () async {
    // Arrange

    when(mockUserProfileRepository.updateUserProfile(userProfile))
        .thenAnswer((_) async => Right(unit));

    // Act
    final result = await usecase(userProfile);

    // Assert
    expect(result, Right(unit));
    verify(mockUserProfileRepository.updateUserProfile(userProfile));
    verifyNoMoreInteractions(mockUserProfileRepository);
  });

  test('should return a failure when getting user profile fails', () async {
    // Arrange
    final userId = '1';

    when(mockUserProfileRepository.updateUserProfile(userProfile))
        .thenAnswer((_) async => Left(ServerFailure()));

    // Act
    final result = await usecase(userProfile);

    // Assert
    expect(result, Left(ServerFailure()));
    verify(mockUserProfileRepository.updateUserProfile(userProfile));
    verifyNoMoreInteractions(mockUserProfileRepository);
  });

  // Add more tests for GetUserProfile use case as needed
}
