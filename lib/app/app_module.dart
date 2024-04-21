import 'package:flutter_modular/flutter_modular.dart';

import 'modules/add_register/add_vacancy_module.dart';
import 'modules/detail_register/detail_register_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/detail', module: DetailRegisterModule());
    r.module('/add', module: AddRegisterModule());
  }
}
