import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 11,
      height: 11,
      decoration: BoxDecoration(
        color: color ?? colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
