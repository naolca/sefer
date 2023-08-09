import 'package:sefer/features/authentication/data/models/auth_result_model.dart';
import '../../domain/entities/user_credentials.dart';

abstract class AuthenticatonRemoteDataSource {
  Future<AuthResultModel> registerUser(UserCredentials credentials);
  Future<AuthResultModel> loginUser(UserCredentials credentials);
  Future<void> logoutUser();
}
