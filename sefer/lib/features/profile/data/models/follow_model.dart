import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sefer/features/profile/domain/entities/follow.dart';

class FollowModel extends Follow {
  FollowModel({
    required followId,
    required String followerId,
    required String followingId,
    required DateTime timestamp,
  }) : super(
          followId: followId,
          followerId: followerId,
          followingId: followingId,
          timestamp: timestamp,
        );

  factory FollowModel.fromJson(Map<String, dynamic> json) {
    return FollowModel(
      followId: json['followId'],
      followerId: json['followerId'],
      followingId: json['followingId'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'followId': followId,
      'followerId': followerId,
      'followingId': followingId,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
