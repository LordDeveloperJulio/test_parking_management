import 'package:flutter/material.dart';

import '../../../shared/utils/sizes.dart';

class InputTextWidget extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const InputTextWidget({
    super.key,
    required this.label,
    this.controller,
    this.validator, this.keyboardType,
  });

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.x2, bottom: Sizes.x2),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label),
        ),
        validator: widget.validator,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
