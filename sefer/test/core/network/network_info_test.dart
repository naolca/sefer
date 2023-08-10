import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sefer/core/network/network_info.dart';

import '../../features/authentication/data/repository/authentication_repository_impl_test.mocks.dart';
import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionCheckerPlus])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionCheckerPlus mockInternetConnectionCheckerPlus;

  setUp(() {
    mockInternetConnectionCheckerPlus = MockInternetConnectionCheckerPlus();
    networkInfoImpl =
        NetworkInfoImpl(connectionChecker: mockInternetConnectionCheckerPlus);
  });

  test(
      "should call the connection checker when network info isconnected is called",
      () async {
    //arrange
    final thasConnection = Future.value(true);
    when(mockInternetConnectionCheckerPlus.hasConnection)
        .thenAnswer((_) => thasConnection);

    //act
    final result = networkInfoImpl.isConnected;

    //assert
    verify(mockInternetConnectionCheckerPlus.hasConnection);
    expect(result, thasConnection);
  });
}
