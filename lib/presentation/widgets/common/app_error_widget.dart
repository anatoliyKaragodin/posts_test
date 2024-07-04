import 'package:flutter/material.dart';

/// Виджет, который отображает текст ошибки
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    required this.errorText
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error: $errorText'));
  }
}