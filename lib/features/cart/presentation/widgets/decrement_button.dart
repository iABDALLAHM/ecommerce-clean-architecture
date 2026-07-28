import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: ShapeDecoration(
          color: colorScheme.outlineVariant,
          shape: OvalBorder(),
        ),
        child: Icon(Icons.remove, color: colorScheme.tertiary),
      ),
    );
  }
}
