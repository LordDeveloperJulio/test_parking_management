import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/utils/colors_pallete.dart';
import '../../shared/utils/sizes.dart';
import '../../shared/widgets/widget.dart';
import '../domain/domain.dart';
import 'add_register_keys/add_register_keys.dart';
import 'add_vacancy_page_mixin.dart';
import 'bloc/add_vacancy_bloc.dart';
import 'bloc/add_vacancy_event.dart';
import 'bloc/add_vacancy_state.dart';
import 'widget/widget.dart';

class AddRegisterPage extends StatefulWidget {
  const AddRegisterPage({super.key});

  @override
  State<AddRegisterPage> createState() => _AddRegisterPageState();
}

class _AddRegisterPageState extends State<AddRegisterPage>
    with AddRegisterPageMixin {
  validateFields(AddRegisterEntity registerVacancyEntity) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      addRegisterBloc.add(RegisterVacancyEvent(
        registerVacancyEntity: registerVacancyEntity,
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    addRegisterBloc.add(GetAddRegisterEvent());
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
        body: BlocConsumer<AddRegisterBloc, AddRegisterState>(
          listener: (context, state) {
            if (state is FailureAddRegisterState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: TextViewWidget(
                    label: 'Error: ${state.error}',
                    size: Sizes.x2,
                    color: ColorsPallete.redColor,
                  ),
                ),
              );
              addRegisterBloc.add(GetAddRegisterEvent());
            }

            if (state is SuccessAddRegisterState) {
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
              Modular.to.pop(true);
            }
          },
          bloc: addRegisterBloc,
          builder: (context, state) {
            if (state is LoadingAddRegisterState) {
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InputTextWidget(
                          key: AddRegisterKeys.driverNameInputKey,
                          label: 'Condutor',
                          controller: driverNameController,
                          validator: validateEmpty,
                        ),
                        InputTextWidget(
                          key: AddRegisterKeys.plateInputKey,
                          label: 'Placa',
                          controller: plateController,
                          validator: validateEmpty,
                        ),
                        SizedBox(
                          height: Sizes.x6,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: DropdownButtonFormField<VacancyEntity>(
                            key: AddRegisterKeys.vacancySelectKey,
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
                                  key: AddRegisterKeys.vacancySelectItemKey,
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
                              key: AddRegisterKeys.registerButtonKey,
                              onPressed: () {
                                validateFields(
                                  AddRegisterEntity(
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
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
