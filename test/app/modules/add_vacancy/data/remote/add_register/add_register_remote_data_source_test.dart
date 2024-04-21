import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/data/data.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final AddRegisterRemoteDataSource dataSource;
  late final NetworkClient client;

  setUpAll(() {
    client = MockNetworkClient();
    dataSource = AddRegisterRemoteDataSourceImpl(networkClient: client);
  });

  test('method get should return a Map<dynamic, dynamic>', () async {
    when(
      () => client.post(any(), data: {
        'driverName': Resources.mockUpdateRegister.driverName,
        'plate': Resources.mockUpdateRegister.plate,
        'vacancyId': Resources.mockUpdateRegister.vacancyId,
        'dateEntry': Resources.mockUpdateRegister.dateEntry,
        'dateExit': Resources.mockUpdateRegister.dateExit,
      }),
    ).thenAnswer((_) async => Resources.mockUpdateRegisterHttpResponse);

    final response = await dataSource.addRegister(registerVacancyEntity: Resources.mockAddRegister);
    expect(response, isA<Right<HttpExceptions, Map>>());
  });

  test('method put should return a throw exception', () async {
    when(
          () => client.post(any(), data: {
        'driverName': Resources.mockUpdateRegister.driverName,
        'plate': Resources.mockUpdateRegister.plate,
        'vacancyId': Resources.mockUpdateRegister.vacancyId,
        'dateEntry': Resources.mockUpdateRegister.dateEntry,
        'dateExit': Resources.mockUpdateRegister.dateExit,
      }),
    ).thenThrow(
      HttpGeneralException(statusCode: 406, data: null),
    );

    final response =
    await dataSource.addRegister(registerVacancyEntity: Resources.mockAddRegister);

    expect(
        response,
        isA<Left<HttpExceptions, Map>>()
    );
  });
}
