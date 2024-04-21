import 'package:flutter/material.dart';

import '../../../shared/utils/colors_pallete.dart';
import '../../../shared/utils/sizes.dart';
import '../../../shared/widgets/widget.dart';

class CardHomeWidget extends StatefulWidget {
  final String name;
  final String plate;
  final String vacancy;
  final Function()? onTap;

  const CardHomeWidget({
    super.key,
    required this.name,
    required this.plate,
    required this.vacancy,
    this.onTap,
  });

  @override
  State<CardHomeWidget> createState() => _CardHomeWidgetState();
}

class _CardHomeWidgetState extends State<CardHomeWidget> {
  SizedBox sizedBox = const SizedBox(
    width: Sizes.x1,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: Sizes.x10,
        width: double.infinity,
        margin: const EdgeInsets.all(Sizes.x1),
        decoration: BoxDecoration(
          color: ColorsPallete.backgroundColor,
          borderRadius: BorderRadius.circular(Sizes.x1),
          border: Border.all(color: ColorsPallete.primaryColor, width: 0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.x1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowLabelWidget(
                title: 'Condutor: ',
                label: widget.name,
                icon: Icons.drive_eta_outlined,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.notes,
                    size: Sizes.x3,
                  ),
                  sizedBox,
                  const TextViewWidget(
                    label: 'Placa: ',
                    color: ColorsPallete.greyColor,
                    size: Sizes.x1,
                  ),
                  sizedBox,
                  TextViewWidget(
                    label: widget.plate,
                    color: ColorsPallete.primaryColor,
                    size: Sizes.x2,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: Sizes.x3,
                    color: ColorsPallete.primaryColor,
                  ),
                ],
              ),
              RowLabelWidget(
                title: 'Vaga: ',
                label: widget.vacancy,
                icon: Icons.location_on_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}