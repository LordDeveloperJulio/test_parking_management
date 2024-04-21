import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/data/data.dart';
import 'package:test_parking_management/app/modules/add_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/add_register/infra/infra.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final AddRegisterRepository repository;
  late final AddRegisterRemoteDataSource dataSource;

  setUpAll(() {
    dataSource = MockAddRegisterRemoteDataSource();
    repository = AddRegisterRepositoryImpl(dataSource: dataSource);
  });

  test('when the addRegister method is called AddRegisterEntity', () async {
    when(
      () => dataSource.addRegister(
        registerVacancyEntity: Resources.mockAddRegister,
      ),
    ).thenAnswer(
      (_) async => Right(
        Resources.mockAddRegisterHttpResponseData,
      ),
    );

    final response = await repository.addRegister(
      registerVacancyEntity: Resources.mockAddRegister,
    );

    expect(response, isA<Right<NetworkExceptions, AddRegisterEntity>>());
  });

  test('should return an exception when the addRegister method is called',
      () async {
    when(
      () => dataSource.addRegister(
        registerVacancyEntity: Resources.mockAddRegister,
      ),
    ).thenAnswer(
      (_) async => Left(
        HttpGeneralException(statusCode: null, data: {}),
      ),
    );
    final response = await repository.addRegister(
      registerVacancyEntity: Resources.mockAddRegister,
    );
    expect(response, isA<Left<NetworkExceptions, AddRegisterEntity>>());
  });
}
