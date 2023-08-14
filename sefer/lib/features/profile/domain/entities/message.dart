import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String messageId;
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;

  Message({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [messageId];

  @override
  bool get stringify => true;
}
