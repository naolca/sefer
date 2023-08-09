import 'package:sefer/features/authentication/data/models/auth_result_model.dart';
import 'package:sefer/features/authentication/data/models/user_model.dart';

abstract class AuthenticationLocalDataSource {
  Future<AuthResultModel> getUser();
  Future<void> cacheUser();
  Future<void> clearUser();
}
