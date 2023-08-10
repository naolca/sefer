import 'dart:convert';
import 'package:sefer/core/errors/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/exceptions.dart';
import 'package:sefer/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:sefer/features/authentication/data/models/auth_result_model.dart';
import 'package:sefer/features/authentication/domain/entities/auth_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:matcher/matcher.dart';

import 'authentication_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late AuthenticationLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = AuthenticationLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  group("get cached user", () {
    final expectedMap = {"isSuccess": true};

    final tAuthResultModel =
        AuthResultModel.fromJson(json.decode(json.encode(expectedMap)));

    test(
        "should return auth result from the shared preferences when there is one in cache",
        () async {
      //arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(json.encode(expectedMap));

      //act
      final result = await dataSource.getUser();
      //assert

      verify(mockSharedPreferences.getString("CACHED_USER"));
      expect(result, equals(tAuthResultModel));
    });

    test(
      "should throw a cache exception error when there is no cached user in the shared preferences",
      () async {
        //arrange
        when(mockSharedPreferences.getString(any)).thenReturn("");

        //act
        final call = dataSource.getUser; // Note the return type

        //assert

        expect(() => call(), throwsA(TypeMatcher<CacheException>()));
      },
    );
  });

  group('cache user', () {
    final tAuthModel = AuthResultModel(isSuccess: true);
    test(
      "should call the sharedpreferences to cache the user data",
      () async {
        //arrange
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) => Future.value(true)); // Return a completed Future
        final tAuthModel = AuthResultModel(isSuccess: true);
        final expectedJsonString = json.encode(tAuthModel.toJson());

        //act
        await dataSource.cacheUser(tAuthModel);

        //assert
        verify(
          mockSharedPreferences.setString("CACHED_USER", expectedJsonString),
        );
      },
    );
  });
}
