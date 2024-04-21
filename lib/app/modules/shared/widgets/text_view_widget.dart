import 'package:flutter/material.dart';

class TextViewWidget extends StatelessWidget {
  final String label;
  final double size;
  final Color color;

  const TextViewWidget({
    super.key,
    required this.label,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.normal
      ),
      maxLines: 1,
    );
  }
}
