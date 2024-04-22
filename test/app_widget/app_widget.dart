import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  final Widget widget;

  const AppWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: widget,
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
