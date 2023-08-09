import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/authentication/domain/entities/auth_result.dart';
import 'package:sefer/features/authentication/domain/entities/user_credentials.dart';
import 'package:sefer/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:sefer/features/authentication/domain/usecases/register_user.dart';
import 'login_user_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  late RegisterUser usecase;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    usecase = RegisterUser(mockAuthenticationRepository);
  });

  const identifier = "firaol";
  const password = "123456";
  final credentials =
      UserCredentials(identifier: identifier, password: password);
  final authResult = AuthResult(isSuccess: true);
  test("this should register a new user", () async {
    // Call the method on the mock repository
    when(mockAuthenticationRepository.registerUser(credentials))
        .thenAnswer((_) async => Right(authResult));

    final result = await usecase.registerUser(credentials);

    expect(result, Right(authResult));
    verify(mockAuthenticationRepository.registerUser(credentials));
  });
}
