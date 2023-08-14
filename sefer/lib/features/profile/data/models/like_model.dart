import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sefer/features/profile/domain/entities/like.dart';

class LikeModel extends Like {
  LikeModel({
    required String likeId,
    required String userId,
    required String postId,
    required DateTime timestamp,
  }) : super(
          likeId: likeId,
          userId: userId,
          postId: postId,
          timestamp: timestamp,
        );

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      likeId: json['likeId'],
      userId: json['userId'],
      postId: json['postId'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'likeId': likeId,
      'userId': userId,
      'postId': postId,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
