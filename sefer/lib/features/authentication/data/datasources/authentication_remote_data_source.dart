import 'package:sefer/features/authentication/data/models/auth_result_model.dart';
import '../../domain/entities/user_credentials.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticatonRemoteDataSource {
  Future<AuthResultModel> registerUser(UserCredentials credentials);
  Future<AuthResultModel> loginUser(UserCredentials credentials);
  Future<void> logoutUser();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticatonRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AuthResultModel> registerUser(UserCredentials credentials) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: credentials.identifier,
        password: credentials.password,
      );

      return AuthResultModel(isSuccess: true);
    } catch (e) {
      // Handle registration errors and return a failure or error message
      return AuthResultModel(isSuccess: false, errorMessage: e.toString());
    }
  }

  @override
  Future<AuthResultModel> loginUser(UserCredentials credentials) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: credentials.identifier,
        password: credentials.password,
      );
      print("RESULTTTTTTTTTTTTTTTTTT:$authResult");

      return AuthResultModel(isSuccess: true);
    } catch (e) {
      // Handle login errors and return a failure or error message
      return AuthResultModel(isSuccess: false, errorMessage: e.toString());
    }
  }

  @override
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
