import 'dart:convert';
import 'package:sefer/core/errors/exceptions.dart';
import 'package:sefer/features/authentication/data/models/auth_result_model.dart';
import 'package:sefer/features/authentication/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationLocalDataSource {
  Future<AuthResultModel> getUser();
  Future<void> cacheUser(AuthResultModel authResultModel);
  Future<void> clearUser();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthenticationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUser(AuthResultModel authResultModel) async {
    sharedPreferences.setString(
        "CACHED_USER", json.encode(authResultModel.toJson()));
  }

  @override
  Future<void> clearUser() {
    // TODO: implement clearUser
    throw UnimplementedError();
  }

  @override
  Future<AuthResultModel> getUser() {
    final jsonString = sharedPreferences.getString("CACHED_USER");

    if (jsonString != "") {
      return Future.value(AuthResultModel.fromJson(json.decode(jsonString!)));
    } else {
      throw CacheException();
    }
  }
}
