import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sefer/features/profile/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel({
    required String commentId,
    required String userId,
    required String postId,
    required String text,
    required DateTime timestamp,
  }) : super(
          commentId: commentId,
          userId: userId,
          postId: postId,
          text: text,
          timestamp: timestamp,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['commentId'],
      userId: json['userId'],
      postId: json['postId'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'userId': userId,
      'postId': postId,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
