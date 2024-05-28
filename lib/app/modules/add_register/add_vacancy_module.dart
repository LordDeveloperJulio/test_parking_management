import 'package:core_network/core_network.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'infra/infra.dart';
import 'presentation/add_vacancy_page.dart';
import 'presentation/bloc/add_vacancy_bloc.dart';

class AddRegisterModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    //BLOC
    i.add<AddRegisterBloc>(AddRegisterBloc.new, config: BindConfig(onDispose: (bloc) => bloc.close()));
    //USECASE
    i.add<GetVacancyUseCase>(
      () => GetVacancyUseCaseImpl(repository: Modular.get<GetListVacancyRepository>()),
    );
    i.add<AddRegisterUseCase>(
      () => AddRegisterUseCaseImpl(repository: Modular.get<AddRegisterRepository>()),
    );
    //REPOSITORY
    i.add<GetListVacancyRepository>(
      () => GetListVacancyRepositoryImpl(dataSource: Modular.get<GetListVacancyRemoteDataSource>()),
    );
    i.add<AddRegisterRepository>(
      () => AddRegisterRepositoryImpl(dataSource: Modular.get<AddRegisterRemoteDataSource>()),
    );
    //DATASOURCE
    i.add<GetListVacancyRemoteDataSource>(
      () => GetListVacancyRemoteDataSourceImpl(networkClient: CoreNetwork.instance),
    );
    i.add<AddRegisterRemoteDataSource>(
      () => AddRegisterRemoteDataSourceImpl(networkClient: CoreNetwork.instance),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const AddRegisterPage());
  }
}
