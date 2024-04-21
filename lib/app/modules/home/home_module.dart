import 'package:core_network/core_network.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_bloc.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'infra/infra.dart';
import 'presentation/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    //BLOC
    i.add(
      () => HomeBloc(
        getListVacancyUseCase: Modular.get<GetAllRegistersUseCase>(),
      ),
    );
    //USECASE
    i.add<GetAllRegistersUseCase>(
      () => GetAllRegistersUseCaseImpl(
          repository: Modular.get<GetAllRegistersRepository>()),
    );
    //REPOSITORY
    i.add<GetAllRegistersRepository>(
      () => GetAllRegistersRepositoryImpl(
          dataSource: Modular.get<GetAllRegistersRemoteDataSource>()),
    );
    //DATASOURCE
    i.add<GetAllRegistersRemoteDataSource>(
      () => GetAllRegistersRemoteDataSourceImpl(
          networkClient: CoreNetwork.instance),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
