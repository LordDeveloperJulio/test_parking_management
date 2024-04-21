import 'package:core_network/core_network.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/home/data/data.dart';
import 'package:test_parking_management/app/modules/home/infra/infra.dart';
import 'package:test_parking_management/app/modules/shared/domain/entities/entities.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../mock/mocks.dart';
import '../../../../../resources.dart';

void main() {
  late final GetAllRegistersRepository repository;
  late final GetAllRegistersRemoteDataSource dataSource;

  setUpAll(() {
    dataSource = MockGetAllRegistersRemoteDataSource();
    repository = GetAllRegistersRepositoryImpl(dataSource: dataSource);
  });

  test(
      'when the getAllRegisters method is called with the dateEntry parameter it must return a list of RegistersEntity',
      () async {
    when(
      () => dataSource.getAllRegisters(param: 'dateEntry'),
    ).thenAnswer(
      (_) async => Right(
        Resources.mockGetAllRegistersHttpResponseData,
      ),
    );

    final response = await repository.getAllRegisters(param: 'dateEntry');

    expect(response, isA<Right<NetworkExceptions, List<RegistersEntity>>>());
  });

  test(
      'should return an exception when the getAllRegisters method with the dateEntry parameter is called',
      () async {
    when(
      () => dataSource.getAllRegisters(param: 'dateEntry'),
    ).thenAnswer(
      (_) async => Left(
        HttpGeneralException(
          statusCode: 400,
          data: null,
        ),
      ),
    );
    final response = await repository.getAllRegisters(param: 'dateEntry');
    expect(response, isA<Left<NetworkExceptions, List<RegistersEntity>>>());
  });
}
