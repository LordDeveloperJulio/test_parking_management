import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/add_register/presentation/bloc/add_vacancy_bloc.dart';
import 'package:test_parking_management/app/modules/add_register/presentation/bloc/add_vacancy_event.dart';
import 'package:test_parking_management/app/modules/add_register/presentation/bloc/add_vacancy_state.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_state.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../mock/mocks.dart';
import '../../../../../resources.dart';

void main() {
  late final MockGetListVacancyRepository mockGetListVacancyRepository;
  late final MockAddRegisterRepository mockAddRegisterRepository;
  late final GetVacancyUseCase getVacancyUseCase;
  late final AddRegisterUseCase addRegisterUseCase;

  setUpAll(() {
    mockGetListVacancyRepository = MockGetListVacancyRepository();
    mockAddRegisterRepository = MockAddRegisterRepository();
    getVacancyUseCase =
        GetVacancyUseCaseImpl(repository: mockGetListVacancyRepository);
    addRegisterUseCase =
        AddRegisterUseCaseImpl(repository: mockAddRegisterRepository);
  });

  group('should search for all available vacancies', () {
    blocTest<AddRegisterBloc, AddRegisterState>(
      'emits SuccessListVacancyState when getVacancy method is called',
      setUp: () {
        when(() => mockGetListVacancyRepository.getVacancy())
            .thenAnswer((_) async => Right(Resources.mockGetVacancy));
      },
      build: () => AddRegisterBloc(
        getVacancyUseCase: getVacancyUseCase,
        addRegisterUseCase: addRegisterUseCase,
      ),
      act: (bloc) {
        bloc.add(GetAddRegisterEvent());
      },
      expect: () => [
        isA<LoadingAddRegisterState>(),
        isA<SuccessListVacancyState>(),
      ],
    );

    blocTest<AddRegisterBloc, AddRegisterState>(
      'emits FailureAddRegisterState when getVacancy method is called',
      setUp: () {
        when(() => mockGetListVacancyRepository.getVacancy())
            .thenAnswer((_) async => Left(NetworkBadRequestException()));
      },
      build: () => AddRegisterBloc(
        getVacancyUseCase: getVacancyUseCase,
        addRegisterUseCase: addRegisterUseCase,
      ),
      act: (bloc) {
        bloc.add(GetAddRegisterEvent());
      },
      expect: () => [
        isA<LoadingAddRegisterState>(),
        isA<FailureAddRegisterState>(),
      ],
    );
  });

  group('must make a record of the occupation of a vacancy', () {
    blocTest<AddRegisterBloc, AddRegisterState>(
      'emits SuccessAddRegisterState when addRegister method is called',
      setUp: () {
        when(
          () => mockAddRegisterRepository.addRegister(
            registerVacancyEntity: Resources.mockAddRegister,
          ),
        ).thenAnswer((_) async => Right(Resources.mockAddRegister));
      },
      build: () => AddRegisterBloc(
        getVacancyUseCase: getVacancyUseCase,
        addRegisterUseCase: addRegisterUseCase,
      ),
      act: (bloc) {
        bloc.add(
          RegisterVacancyEvent(
            registerVacancyEntity: Resources.mockAddRegister,
          ),
        );
      },
      expect: () => [
        isA<LoadingAddRegisterState>(),
        isA<SuccessAddRegisterState>(),
      ],
    );

    blocTest<AddRegisterBloc, AddRegisterState>(
      'emits FailureAddRegisterState when addRegister method is called',
      setUp: () {
        when(
          () => mockAddRegisterRepository.addRegister(
            registerVacancyEntity: Resources.mockAddRegister,
          ),
        ).thenAnswer((_) async => Left(NetworkBadRequestException()));
      },
      build: () => AddRegisterBloc(
        getVacancyUseCase: getVacancyUseCase,
        addRegisterUseCase: addRegisterUseCase,
      ),
      act: (bloc) {
        bloc.add(
          RegisterVacancyEvent(
            registerVacancyEntity: Resources.mockAddRegister,
          ),
        );
      },
      expect: () => [
        isA<LoadingAddRegisterState>(),
        isA<FailureAddRegisterState>(),
      ],
    );
  });
}
