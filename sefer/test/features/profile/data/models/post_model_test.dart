import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/profile/data/models/message_model.dart';
import 'package:sefer/features/profile/data/models/post_model.dart';
import 'package:sefer/features/profile/domain/entities/message.dart';
import 'package:sefer/features/profile/domain/entities/post.dart';

void main() {
  final postModel = PostModel(
      postId: "1",
      userId: "2",
      imageUrl: "www.example.com",
      caption: "this is it",
      timestamp: DateTime(2022));

  group('post Model', () {
    test("should be a subclass of the Post entity", () async {
      //assert
      expect(postModel, isA<Post>());
    });

    test("should convert to JSON and from JSON", () async {
      //arrange

      //act
      final json = postModel.toJson();
      final fromJson = PostModel.fromJson(json);

      //assert
      expect(json, isA<Map<String, dynamic>>());
      expect(fromJson, equals(postModel));
    });
  });
}
