import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/detail_register/data/data.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final UpdateRegisterRemoteDataSource dataSource;
  late final NetworkClient client;

  setUpAll(() {
    client = MockNetworkClient();
    dataSource = UpdateRegisterRemoteDataSourceImpl(networkClient: client);
  });

  test('method get should return a Map<dynamic, dynamic>', () async {
    when(
      () => client.put(any(), data: {
        'id': Resources.mockUpdateRegister.id,
        'driverName': Resources.mockUpdateRegister.driverName,
        'plate': Resources.mockUpdateRegister.plate,
        'vacancyId': Resources.mockUpdateRegister.vacancyId,
        'dateEntry': Resources.mockUpdateRegister.dateEntry,
        'dateExit': Resources.mockUpdateRegister.dateExit,
      }),
    ).thenAnswer((_) async => Resources.mockUpdateRegisterHttpResponse);

    final response = await dataSource.updateRegister(registerVacancyEntity: Resources.mockUpdateRegister);
    expect(response, isA<Right<HttpExceptions, Map<dynamic, dynamic>>>());
  });
}
