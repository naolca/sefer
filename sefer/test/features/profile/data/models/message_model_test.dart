import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/profile/data/models/message_model.dart';
import 'package:sefer/features/profile/domain/entities/message.dart';

void main() {
  final messageModel = MessageModel(
    messageId: '1',
    senderId: 'sender123',
    receiverId: 'receiver456',
    text: 'Hello there!',
    timestamp: DateTime(2023, 8, 10),
  );

  group('MessageModel', () {
    test('should be a subclass of Message entity', () {
      // Arrange
      expect(messageModel, isA<Message>());
    });

    test('should convert to JSON and from JSON', () {
      // Arrange

      // Act
      final json = messageModel.toJson();
      final fromJson = MessageModel.fromJson(json);

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(fromJson, equals(messageModel));
    });
  });
}
