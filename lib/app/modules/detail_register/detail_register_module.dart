import 'package:core_network/core_network.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'infra/infra.dart';
import 'presentation/bloc/detail_register_bloc.dart';
import 'presentation/detail_register_page.dart';

class DetailRegisterModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    //BLOC
    i.add(
      () => DetailRegisterBloc(
          updateRegisterUseCase: Modular.get<UpdateRegisterUseCase>()),
    );
    //USECASE
    i.add<UpdateRegisterUseCase>(
      () => UpdateRegisterUseCaseImpl(
          repository: Modular.get<UpdateRegisterRepository>()),
    );
    //REPOSITORY
    i.add<UpdateRegisterRepository>(
      () => UpdateRegisterRepositoryImpl(
          dataSource: Modular.get<UpdateRegisterRemoteDataSource>()),
    );
    //DATASOURCE
    i.add<UpdateRegisterRemoteDataSource>(
      () => UpdateRegisterRemoteDataSourceImpl(
          networkClient: CoreNetwork.instance),
    );
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => DetailRegisterPage(vacancyEntity: r.args.data));
  }
}
