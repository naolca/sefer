// Mocks generated by Mockito 5.4.0 from annotations
// in sefer/test/features/profile/domain/entities/get_posts_for_user_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sefer/core/errors/failures.dart' as _i5;
import 'package:sefer/features/profile/domain/entities/post.dart' as _i6;
import 'package:sefer/features/profile/domain/repositories/post_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PostRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostRepository extends _i1.Mock implements _i3.PostRepository {
  MockPostRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Post>>> getPostsForUser(
          String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPostsForUser,
          [userId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Post>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Post>>(
          this,
          Invocation.method(
            #getPostsForUser,
            [userId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Post>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Post>>> getFeedPosts(
          String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFeedPosts,
          [userId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Post>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Post>>(
          this,
          Invocation.method(
            #getFeedPosts,
            [userId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Post>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> createPost(_i6.Post? post) =>
      (super.noSuchMethod(
        Invocation.method(
          #createPost,
          [post],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #createPost,
            [post],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> deletePost(String? postId) =>
      (super.noSuchMethod(
        Invocation.method(
          #deletePost,
          [postId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #deletePost,
            [postId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> likePost(
    String? postId,
    String? userId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #likePost,
          [
            postId,
            userId,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #likePost,
            [
              postId,
              userId,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> unlikePost(
    String? postId,
    String? userId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #unlikePost,
          [
            postId,
            userId,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #unlikePost,
            [
              postId,
              userId,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);
}
