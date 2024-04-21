import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/domain.dart';
import 'bloc/add_vacancy_bloc.dart';

mixin AddVacancyPageMixin {
  final AddVacancyBloc addVacancyBloc = Modular.get<AddVacancyBloc>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController driverNameController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  TextEditingController vacancyController = TextEditingController();

  VacancyEntity? selectedValue;

  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor, insira os dados";
    }
    return null;
  }
}
