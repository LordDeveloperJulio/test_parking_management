import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_parking_management/app/modules/add_vacancy/domain/domain.dart';

import '../../shared/utils/colors_pallete.dart';
import '../../shared/utils/sizes.dart';
import '../../shared/widgets/widget.dart';
import 'add_vacancy_page_mixin.dart';
import 'bloc/add_vacancy_bloc.dart';
import 'bloc/add_vacancy_event.dart';
import 'bloc/add_vacancy_state.dart';
import 'widget/widget.dart';

class AddVacancyPage extends StatefulWidget {
  const AddVacancyPage({super.key});

  @override
  State<AddVacancyPage> createState() => _AddVacancyPageState();
}

class _AddVacancyPageState extends State<AddVacancyPage>
    with AddVacancyPageMixin {
  validateFields(RegisterVacancyEntity registerVacancyEntity) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      addVacancyBloc.add(RegisterVacancyEvent(
        registerVacancyEntity: registerVacancyEntity,
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    addVacancyBloc.add(GetAddVacancyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsPallete.primaryColor,
          title: const TextViewWidget(
            label: 'Registrar',
            size: Sizes.x3,
            color: ColorsPallete.backgroundColor,
          ),
          leading: const BackButton(
            color: ColorsPallete.backgroundColor,
          ),
        ),
        backgroundColor: ColorsPallete.backgroundColor,
        body: BlocConsumer<AddVacancyBloc, AddVacancyState>(
          listener: (context, state) {
            if (state is FailureAddVacancyState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: TextViewWidget(
                    label: 'Error: ${state.error}',
                    size: Sizes.x2,
                    color: ColorsPallete.redColor,
                  ),
                ),
              );
              addVacancyBloc.add(GetAddVacancyEvent());
            }

            if (state is SuccessAddVacancyState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: TextViewWidget(
                    label: 'Cadastro realizado com sucesso!',
                    size: Sizes.x2,
                    color: ColorsPallete.backgroundColor,
                  ),
                  backgroundColor: ColorsPallete.primaryColor,
                ),
              );
              Modular.to.pop();
            }
          },
          bloc: addVacancyBloc,
          builder: (context, state) {
            if (state is LoadingAddVacancyState) {
              const CircularProgressIndicator(
                color: ColorsPallete.primaryColor,
              );
            }

            if (state is SuccessListVacancyState) {
              List<VacancyEntity> list = [];

              for (var i in state.data) {
                if (i.statusVaga == "DISPONIVEL") {
                  list.add(i);
                }
              }

              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.x2),
                  child: Column(
                    children: [
                      InputTextWidget(
                        label: 'Condutor',
                        controller: driverNameController,
                        validator: validateEmpty,
                      ),
                      InputTextWidget(
                        label: 'Placa',
                        controller: plateController,
                        validator: validateEmpty,
                      ),
                      SizedBox(
                        height: Sizes.x6,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField<VacancyEntity>(
                          hint: selectedValue != null
                              ? Text('${selectedValue?.number}')
                              : const Text('Vaga: '),
                          icon: const Icon(Icons.arrow_drop_down),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          items: List.generate(
                            list.length,
                            (index) => DropdownMenuItem(
                              value:
                              list[index],
                              child: Text(
                                '${state.data[index].number}',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Sizes.x7),
                        child: SizedBox(
                          height: Sizes.x6,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              validateFields(
                                RegisterVacancyEntity(
                                  driverName: driverNameController.text,
                                  plate: plateController.text,
                                  vacancyId: selectedValue?.id ?? 0,
                                  dateEntry: DateTime.now().toString(),
                                  dateExit: '',
                                ),
                              );
                            },
                            child: const Text(
                              'Registrar',
                              style: TextStyle(fontSize: Sizes.x2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
