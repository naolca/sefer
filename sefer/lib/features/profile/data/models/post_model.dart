import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required String postId,
    required String userId,
    required String imageUrl,
    required String caption,
    required DateTime timestamp,
  }) : super(
          postId: postId,
          userId: userId,
          imageUrl: imageUrl,
          caption: caption,
          timestamp: timestamp,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: json['postId'],
      userId: json['userId'],
      imageUrl: json['imageUrl'],
      caption: json['caption'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
      'imageUrl': imageUrl,
      'caption': caption,
      'timestamp': timestamp,
    };
  }
}
