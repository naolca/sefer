import 'package:equatable/equatable.dart';

class Follow extends Equatable {
  final String followId;
  final String followerId;
  final String followingId;
  final DateTime timestamp;

  Follow({
    required this.followId,
    required this.followerId,
    required this.followingId,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [followId];

  @override
  bool get stringify => true;
}
