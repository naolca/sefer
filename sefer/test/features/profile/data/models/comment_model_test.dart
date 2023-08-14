import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/profile/data/models/comment_model.dart';
import 'package:sefer/features/profile/domain/entities/comment.dart';

void main() {
  final commentModel = CommentModel(
    commentId: 'comment123',
    postId: 'post456',
    userId: 'user789',
    timestamp: DateTime(2023, 8, 10),
    text: 'cool',
  );
  group('CommentModel', () {
    test('should be a subclass of Comment entity', () {
      // Arrange
      expect(commentModel, isA<Comment>());
    });

    test('should convert to JSON and from JSON', () {
      // Arrange

      // Act
      final json = commentModel.toJson();
      final fromJson = CommentModel.fromJson(json);

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(fromJson, equals(commentModel));
    });
  });
}
