import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String postId;
  final String userId;
  final String imageUrl;
  final String caption;
  final DateTime timestamp;

  Post({
    required this.postId,
    required this.userId,
    required this.imageUrl,
    required this.caption,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [postId];

  @override
  bool get stringify => true;
}
