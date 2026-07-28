import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: ShapeDecoration(
          color: colorScheme.primary,
          shape: OvalBorder(),
        ),
        child: Icon(Icons.add, color: colorScheme.onPrimary),
      ),
    );
  }
}
