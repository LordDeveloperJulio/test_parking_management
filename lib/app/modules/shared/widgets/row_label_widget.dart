import 'package:flutter/material.dart';
import 'package:test_parking_management/app/modules/shared/widgets/text_view_widget.dart';

import '../utils/colors_pallete.dart';
import '../utils/sizes.dart';

class RowLabelWidget extends StatelessWidget {
  final String title;
  final double? sizeTitle;
  final String label;
  final IconData icon;
  final double? sizeIcon;

  const RowLabelWidget({
    super.key,
    required this.title,
    this.sizeTitle,
    required this.label,
    required this.icon,
    this.sizeIcon
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: sizeIcon ?? Sizes.x2,
        ),
        const SizedBox(
          width: Sizes.x1,
        ),
        TextViewWidget(
          label: title,
          color: ColorsPallete.greyColor,
          size: sizeTitle ?? Sizes.x1,
        ),
        const SizedBox(
          width: Sizes.x1,
        ),
        TextViewWidget(
          label: label,
          color: ColorsPallete.primaryColor,
          size: Sizes.x2,
        ),
      ],
    );
  }
}
