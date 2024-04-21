import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/utils/colors_pallete.dart';
import '../../shared/utils/sizes.dart';
import '../../shared/widgets/text_view_widget.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'home_page_mixin.dart';
import 'widget/card_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  void initState() {
    super.initState();
    homeBloc.add(GetHomeListVacancyEvent(param: 'dateEntry'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsPallete.primaryColor,
        title: TextViewWidget(
          label: titlePage,
          size: Sizes.x3,
          color: ColorsPallete.backgroundColor,
        ),
        actions: [
          PopupMenuButton(
            iconColor: Colors.white,
            icon: const Icon(Icons.menu),
            position: PopupMenuPosition.under,
            onSelected: (value) {
              homeBloc.add(GetHomeListVacancyEvent(param: value));
              setState(() {
                changeTitle(value);
              });
            },
            itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  value: 'dateEntry',
                  child: Text("Entradas/Dia"),
                ),
                PopupMenuItem(
                  value: 'dateExit',
                  child: Text("Saídas/Dia"),
                ),
                PopupMenuItem(
                  value: '',
                  child: Text("Entradas e Saídas/Dia"),
                ),
              ];
            },
          )
        ],
      ),
      backgroundColor: ColorsPallete.backgroundColor,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, homeState) {
          if (homeState is FailureHomeState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: TextViewWidget(
                  label: 'Error: ${homeState.error}',
                  size: Sizes.x2,
                  color: ColorsPallete.redColor,
                ),
              ),
            );
            homeBloc.add(GetHomeListVacancyEvent(param: 'dateEntry'));
          }
        },
        bloc: homeBloc,
        builder: (context, homeState) {
          if (homeState is LoadingGetAllRegistersState) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsPallete.primaryColor,
              ),
            );
          }
          if (homeState is SuccessGetAllRegistersState) {
            return RefreshIndicator(
              onRefresh: () async {
                homeBloc.add(GetHomeListVacancyEvent(param: 'dateEntry'));
                setState(() {
                  changeTitle('dateEntry');
                });
              },
              child: ListView.builder(
                itemCount: homeState.data.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: Sizes.x2),
                itemBuilder: (context, index) {
                  return CardHomeWidget(
                    onTap: () {
                      Modular.to.pushNamed(
                        '/detail',
                        arguments: homeState.data[index],
                      );
                    },
                    name: homeState.data[index].driverName,
                    plate: homeState.data[index].plate,
                    vacancy: homeState.data[index].vacancyId.toString(),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsPallete.primaryColor,
        child: const Icon(
          Icons.add,
          color: ColorsPallete.backgroundColor,
          size: Sizes.x3,
        ),
        onPressed: () {
          Modular.to.pushNamed(
            '/add',
          );
        },
      ),
    );
  }
}
