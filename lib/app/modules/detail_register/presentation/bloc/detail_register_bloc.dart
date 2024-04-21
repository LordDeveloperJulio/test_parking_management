import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/entities.dart';
import '../../../shared/exceptions/exceptions.dart';
import '../../domain/usecase/update_register_usecase.dart';
import 'detail_register_event.dart';
import 'detail_register_state.dart';

class DetailRegisterBloc extends Bloc<DetailRegisterEvent, DetailRegisterState> {
  DetailRegisterBloc({
    required this.updateRegisterUseCase,
  }) : super(InitialDetailRegisterState()) {
    on<RegisterUpdateVacancyEvent>(updateRegister);
  }

  final UpdateRegisterUseCase updateRegisterUseCase;

  Future<void> updateRegister(
    RegisterUpdateVacancyEvent event,
    Emitter<DetailRegisterState> emit,
  ) async {
    emit(LoadingDetailRegisterState());
    Either<NetworkExceptions, RegistersEntity> response =
        await updateRegisterUseCase.call(
            registerVacancyEntity: event.registerVacancyEntity);
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureDetailRegisterState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessUpdateRegisterState(data: r)),
    );
  }
}
