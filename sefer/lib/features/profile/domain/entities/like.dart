import 'package:equatable/equatable.dart';

class Like extends Equatable {
  final String likeId;
  final String postId;
  final String userId;
  final DateTime timestamp;

  Like({
    required this.likeId,
    required this.postId,
    required this.userId,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [likeId];

  @override
  bool get stringify => true;
}
