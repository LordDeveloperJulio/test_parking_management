import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/detail_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/detail_register/presentation/bloc/detail_register_bloc.dart';
import 'package:test_parking_management/app/modules/detail_register/presentation/bloc/detail_register_event.dart';
import 'package:test_parking_management/app/modules/detail_register/presentation/bloc/detail_register_state.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../mock/mocks.dart';
import '../../../../../resources.dart';

void main() {
  late final MockUpdateRegisterRepository repository;
  late final UpdateRegisterUseCase updateRegisterUseCase;

  setUpAll(() {
    repository = MockUpdateRegisterRepository();
    updateRegisterUseCase = UpdateRegisterUseCaseImpl(repository: repository);
  });

  blocTest<DetailRegisterBloc, DetailRegisterState>(
    'emits SuccessUpdateRegisterState when updateRegister method is called',
    setUp: () {
      when(() => repository.updateRegister(
              registerVacancyEntity: Resources.mockUpdateRegister))
          .thenAnswer((_) async => Right(Resources.mockUpdateRegister));
    },
    build: () =>
        DetailRegisterBloc(updateRegisterUseCase: updateRegisterUseCase),
    act: (bloc) {
      bloc.add(RegisterUpdateVacancyEvent(
          registerVacancyEntity: Resources.mockUpdateRegister));
    },
    expect: () => [
      isA<LoadingDetailRegisterState>(),
      isA<SuccessUpdateRegisterState>(),
    ],
  );

  blocTest<DetailRegisterBloc, DetailRegisterState>(
    'emits FailureDetailRegisterState when updateRegister method is called',
    setUp: () {
      when(() => repository.updateRegister(
              registerVacancyEntity: Resources.mockUpdateRegister))
          .thenAnswer((_) async => Left(NetworkBadRequestException()));
    },
    build: () =>
        DetailRegisterBloc(updateRegisterUseCase: updateRegisterUseCase),
    act: (bloc) {
      bloc.add(RegisterUpdateVacancyEvent(
          registerVacancyEntity: Resources.mockUpdateRegister));
    },
    expect: () => [
      isA<LoadingDetailRegisterState>(),
      isA<FailureDetailRegisterState>(),
    ],
  );
}
