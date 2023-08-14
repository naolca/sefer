import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/profile/data/models/follow_model.dart';
import 'package:sefer/features/profile/domain/entities/follow.dart';

void main() {
  final followModel = FollowModel(
    followerId: 'follower123',
    followingId: 'following456',
    followId: '1',
    timestamp: DateTime(2022),
  );
  group('FollowModel', () {
    test('should be a subclass of Follow entity', () {
      // Arrange
      expect(followModel, isA<Follow>());
    });

    test('should convert to JSON and from JSON', () {
      // Arrange

      // Act
      final json = followModel.toJson();
      final fromJson = FollowModel.fromJson(json);

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(fromJson, equals(followModel));
    });
  });
}
