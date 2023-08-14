// Mocks generated by Mockito 5.4.0 from annotations
// in sefer/test/features/authentication/data/repository/authentication_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sefer/core/network/network_info.dart' as _i7;
import 'package:sefer/features/authentication/data/datasources/authentication_local_data_source.dart'
    as _i6;
import 'package:sefer/features/authentication/data/datasources/authentication_remote_data_source.dart'
    as _i3;
import 'package:sefer/features/authentication/data/models/auth_result_model.dart'
    as _i2;
import 'package:sefer/features/authentication/domain/entities/user_credentials.dart'
    as _i5;

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

class _FakeAuthResultModel_0 extends _i1.SmartFake
    implements _i2.AuthResultModel {
  _FakeAuthResultModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticatonRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticatonRemoteDataSource extends _i1.Mock
    implements _i3.AuthenticatonRemoteDataSource {
  MockAuthenticatonRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AuthResultModel> registerUser(
          _i5.UserCredentials? credentials) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [credentials],
        ),
        returnValue:
            _i4.Future<_i2.AuthResultModel>.value(_FakeAuthResultModel_0(
          this,
          Invocation.method(
            #registerUser,
            [credentials],
          ),
        )),
      ) as _i4.Future<_i2.AuthResultModel>);
  @override
  _i4.Future<_i2.AuthResultModel> loginUser(_i5.UserCredentials? credentials) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [credentials],
        ),
        returnValue:
            _i4.Future<_i2.AuthResultModel>.value(_FakeAuthResultModel_0(
          this,
          Invocation.method(
            #loginUser,
            [credentials],
          ),
        )),
      ) as _i4.Future<_i2.AuthResultModel>);
  @override
  _i4.Future<void> logoutUser() => (super.noSuchMethod(
        Invocation.method(
          #logoutUser,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [AuthenticationLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationLocalDataSource extends _i1.Mock
    implements _i6.AuthenticationLocalDataSource {
  MockAuthenticationLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AuthResultModel> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue:
            _i4.Future<_i2.AuthResultModel>.value(_FakeAuthResultModel_0(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.AuthResultModel>);
  @override
  _i4.Future<void> cacheUser(_i2.AuthResultModel? authResultModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheUser,
          [authResultModel],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> clearUser() => (super.noSuchMethod(
        Invocation.method(
          #clearUser,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
