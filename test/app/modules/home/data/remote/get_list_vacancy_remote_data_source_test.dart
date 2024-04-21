import 'package:core_network/api/network_client.dart';
import 'package:core_network/core_network.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/home/data/data.dart';

import '../../../../../mock/mocks.dart';
import '../../../../../resources.dart';

void main() {
  late final GetAllRegistersRemoteDataSource dataSource;
  late final NetworkClient client;

  setUpAll(() {
    client = MockNetworkClient();
    dataSource = GetAllRegistersRemoteDataSourceImpl(networkClient: client);
  });

  test('method get should return a List<dynamic>',
      () async {
    when(
      () => client.get(
        any(),
        queryParameters: {
          'dateEntry': true,
        },
      ),
    ).thenAnswer((_) async => Resources.mockHomeHttpResponse);

    final response = await dataSource.getAllRegisters(param: 'dateEntry');
    expect(response, isA<Right<HttpExceptions, List<dynamic>>>());
  });

  test('method get should return a throw exception', () async {
    when(
          () => client.get(
        any(),
        queryParameters: {
          'dateEntry': true,
        },
      ),
    ).thenThrow(
      HttpGeneralException(statusCode: 406, data: null),
    );

    final response =
    await dataSource.getAllRegisters(param: 'dateEntry');

    expect(
      response,
      isA<Left<HttpExceptions, List<dynamic>>>()
    );
  });
}
