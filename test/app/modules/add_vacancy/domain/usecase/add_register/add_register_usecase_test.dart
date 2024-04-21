import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final MockAddRegisterRepository repository;
  late final AddRegisterUseCase usecase;

  setUpAll(() {
    repository = MockAddRegisterRepository();
    usecase = AddRegisterUseCaseImpl(repository: repository);
  });

  test(
      'should return a AddRegisterEntity when the addRegister method is called',
      () async {
    when(() => repository.addRegister(
          registerVacancyEntity: Resources.mockAddRegister,
        )).thenAnswer(
      (_) async => Right(
        Resources.mockAddRegister,
      ),
    );

    final response = await usecase.call(
      registerVacancyEntity: Resources.mockAddRegister,
    );

    expect(response, isA<Right<NetworkExceptions, AddRegisterEntity>>());
  });

  test(
      'should return a NetworkBadRequestException when the addRegister method is called',
      () async {
    when(() => repository.addRegister(
          registerVacancyEntity: Resources.mockAddRegister,
        )).thenAnswer(
      (_) async => Left((NetworkBadRequestException())),
    );
    final response = await usecase.call(
      registerVacancyEntity: Resources.mockAddRegister,
    );
    expect(response, isA<Left<NetworkExceptions, AddRegisterEntity>>());
  });
}
