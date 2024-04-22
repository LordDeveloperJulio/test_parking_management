import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/domain/entities/entities.dart';
import '../../shared/utils/colors_pallete.dart';
import '../../shared/utils/sizes.dart';
import '../../shared/widgets/widget.dart';
import 'bloc/detail_register_event.dart';
import 'bloc/detail_register_state.dart';
import 'detail_keys/detail_keys.dart';
import 'detail_register_page_mixin.dart';

class DetailRegisterPage extends StatefulWidget {
  final RegistersEntity vacancyEntity;

  const DetailRegisterPage({super.key, required this.vacancyEntity});

  @override
  State<DetailRegisterPage> createState() => _DetailRegisterPageState();
}

class _DetailRegisterPageState extends State<DetailRegisterPage>
    with DetailRegisterPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsPallete.primaryColor,
        title: const TextViewWidget(
          label: 'Detalhes',
          size: Sizes.x3,
          color: ColorsPallete.backgroundColor,
        ),
        leading: const BackButton(
          color: ColorsPallete.backgroundColor,
        ),
      ),
      backgroundColor: ColorsPallete.backgroundColor,
      body: BlocConsumer(
          listener: (context, state) {
            if (state is FailureDetailRegisterState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: TextViewWidget(
                    label: 'Error: ${state.error}',
                    size: Sizes.x2,
                    color: ColorsPallete.redColor,
                  ),
                ),
              );
            }

            if (state is SuccessUpdateRegisterState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: TextViewWidget(
                    label: 'Vaga desocupada com sucesso!',
                    size: Sizes.x2,
                    color: ColorsPallete.backgroundColor,
                  ),
                  backgroundColor: ColorsPallete.primaryColor,
                ),
              );
              Modular.to.pop(true);
            }
          },
          bloc: detalRegisterBloc,
          builder: (context, state) {
            return Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: ColorsPallete.backgroundColor,
                margin: const EdgeInsets.all(Sizes.x2),
                elevation: Sizes.x1,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.x2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RowLabelWidget(
                        title: 'Condutor: ',
                        sizeTitle: Sizes.x2,
                        label: widget.vacancyEntity.driverName,
                        icon: Icons.drive_eta_outlined,
                        sizeIcon: Sizes.x3,
                      ),
                      RowLabelWidget(
                        title: 'Placa: ',
                        sizeTitle: Sizes.x2,
                        label: widget.vacancyEntity.plate,
                        icon: Icons.notes,
                        sizeIcon: Sizes.x3,
                      ),
                      RowLabelWidget(
                        title: 'Vaga: ',
                        sizeTitle: Sizes.x2,
                        label: widget.vacancyEntity.vacancyId.toString(),
                        icon: Icons.location_on_outlined,
                        sizeIcon: Sizes.x3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Sizes.x4),
                        child: ElevatedButton(
                          key: DetailKeys.releaseVacancyButtonKey,
                            onPressed: () {
                              detalRegisterBloc.add(
                                RegisterUpdateVacancyEvent(
                                  registerVacancyEntity: RegistersEntity(
                                    id: widget.vacancyEntity.id,
                                    driverName: widget.vacancyEntity.driverName,
                                    plate: widget.vacancyEntity.plate,
                                    vacancyId: widget.vacancyEntity.vacancyId,
                                    dateEntry: widget.vacancyEntity.dateEntry,
                                    dateExit: DateTime.now().toString(),
                                  ),
                                ),
                              );
                            },
                            child: const Text('Desocupar vaga')),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
