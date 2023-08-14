import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String commentId;
  final String postId;
  final String userId;
  final String text;
  final DateTime timestamp;

  Comment({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.text,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [commentId];

  @override
  bool get stringify => true;
}
