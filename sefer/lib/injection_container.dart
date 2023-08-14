import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sefer/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sefer/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:sefer/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:sefer/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:sefer/features/authentication/domain/usecases/login_user.dart';
import 'package:sefer/features/authentication/domain/usecases/logout_user.dart';
import 'package:sefer/features/authentication/domain/usecases/register_user.dart';
import 'package:sefer/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/authentication/data/datasources/authentication_local_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register SharedPreferences asynchronously
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // BLoC
  sl.registerFactory(
    () => AuthenticationBloc(
      sl(),
      sl(),
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticatonRemoteDataSource: sl(),
      authenticationLocalDataSource:
          sl(), // You need to register this dependency too
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthenticatonRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );

  // Data sources
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(
      sharedPreferences: sl(), // Provide the sharedPreferences dependency
    ),
  );

  // Register InternetConnectionCheckerPlus
  sl.registerLazySingleton<InternetConnectionCheckerPlus>(
    () => InternetConnectionCheckerPlus(),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // Other core dependencies (if any)
}
