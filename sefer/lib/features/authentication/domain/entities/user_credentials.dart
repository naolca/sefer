import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final String identifier; // Username or Email
  final String password;

  UserCredentials({
    required this.identifier,
    required this.password,
  });

  @override
  List<Object?> get props => [identifier, password];
}
