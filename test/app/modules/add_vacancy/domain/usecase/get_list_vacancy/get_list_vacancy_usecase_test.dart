import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final MockGetListVacancyRepository repository;
  late final GetVacancyUseCase usecase;

  setUpAll(() {
    repository = MockGetListVacancyRepository();
    usecase = GetVacancyUseCaseImpl(repository: repository);
  });

  test(
      'when the getAllRegisters method is called with the dateEntry parameter it must return a list of RegistersEntity',
          () async {
        when(() => repository.getVacancy()).thenAnswer(
              (_) async => Right(Resources.mockGetVacancy),
        );

        final response = await usecase.call();

        expect(response, isA<Right<NetworkExceptions, List<VacancyEntity>>>());
      });

  test('should return an exception when the getAllRegisters method with the dateEntry parameter is called', () async {
    when(() => repository.getVacancy()).thenAnswer(
          (_) async => Left(NetworkBadRequestException()),
    );
    final response = await usecase.call();
    expect(response, isA<Left<NetworkExceptions, List<VacancyEntity>>>());
  });
}