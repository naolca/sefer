import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/user_profile.dart';
import 'package:sefer/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:sefer/features/profile/domain/usecases/get_user_profile.dart';
import 'get_user_profile_test.mocks.dart';

@GenerateMocks([UserProfileRepository]) // Generated mocks

void main() {
  // Mock repository
  late MockUserProfileRepository mockUserProfileRepository;

  // Use case
  late GetUserProfile getUserProfile;

  setUp(() {
    mockUserProfileRepository = MockUserProfileRepository();

    getUserProfile = GetUserProfile(mockUserProfileRepository);
  });

  test('should get user profile from the repository', () async {
    // Arrange
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

    when(mockUserProfileRepository.getUserProfile(userId))
        .thenAnswer((_) async => Right(userProfile));

    // Act
    final result = await getUserProfile(userId);

    // Assert
    expect(result, Right(userProfile));
    verify(mockUserProfileRepository.getUserProfile(userId));
    verifyNoMoreInteractions(mockUserProfileRepository);
  });

  test('should return a failure when getting user profile fails', () async {
    // Arrange
    final userId = '1';

    when(mockUserProfileRepository.getUserProfile(userId))
        .thenAnswer((_) async => Left(ServerFailure()));

    // Act
    final result = await getUserProfile(userId);

    // Assert
    expect(result, Left(ServerFailure()));
    verify(mockUserProfileRepository.getUserProfile(userId));
    verifyNoMoreInteractions(mockUserProfileRepository);
  });

  // Add more tests for GetUserProfile use case as needed
}
