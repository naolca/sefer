import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/profile/data/models/like_model.dart';
import 'package:sefer/features/profile/domain/entities/like.dart';

void main() {
  final likeModel = LikeModel(
    postId: 'post123',
    userId: 'user456',
    likeId: '1',
    timestamp: DateTime(2022),
  );
  group('LikeModel', () {
    test('should be a subclass of Like entity', () {
      // Arrange
      expect(likeModel, isA<Like>());
    });

    test('should convert to JSON and from JSON', () {
      // Arrange

      // Act
      final json = likeModel.toJson();
      final fromJson = LikeModel.fromJson(json);

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(fromJson, equals(likeModel));
    });
  });
}
