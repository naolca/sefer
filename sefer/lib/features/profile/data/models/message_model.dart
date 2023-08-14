import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sefer/features/profile/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
    required String messageId,
    required String senderId,
    required String receiverId,
    required String text,
    required DateTime timestamp,
  }) : super(
          messageId: messageId,
          senderId: senderId,
          receiverId: receiverId,
          text: text,
          timestamp: timestamp,
        );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
