import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/usecases/follow_user.dart';
import 'package:sefer/features/profile/domain/usecases/unfollow_user.dart';
import 'get_user_profile_test.mocks.dart';

void main() {
  late MockUserProfileRepository mockUserProfileRepository;
  late UnfollowUser usecase;

  const tUserID = '1';
  const tTargetId = '2';

  setUp(() {
    mockUserProfileRepository = MockUserProfileRepository();
    usecase = UnfollowUser(mockUserProfileRepository);
  });

  test(
      "should return return void(unit) when i follow a user and the repo returns succesful",
      () async {
    //arrange

    when(mockUserProfileRepository.unfollowUser(tUserID, tTargetId))
        .thenAnswer((_) async => Right(unit));

    //act
    final result = await usecase(tUserID, tTargetId);

    //assert
    expect(result, Right(unit));
    verify(mockUserProfileRepository.unfollowUser(tUserID, tTargetId));
    verifyNoMoreInteractions(mockUserProfileRepository);
  });

  test("should return a failure upon the repo returning a failure", () async {
    //arrange
    when(mockUserProfileRepository.unfollowUser(tUserID, tTargetId))
        .thenAnswer((_) async => Left(ServerFailure()));

    // Act
    final result = await usecase(tUserID, tTargetId);

    // Assert
    expect(result, Left(ServerFailure()));
    verify(mockUserProfileRepository.unfollowUser(tUserID, tTargetId));
    verifyNoMoreInteractions(mockUserProfileRepository);

    //assert
  });
}
