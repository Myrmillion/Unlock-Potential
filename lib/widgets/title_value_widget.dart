import 'package:flutter/material.dart';

class TitleValueWidget extends StatelessWidget {
  const TitleValueWidget({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: textTheme.displayMedium),
        Text("$value", style: textTheme.headlineMedium),
      ],
    );
  }
}
