import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowWidget extends StatelessWidget {
  const CustomArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: CircleAvatar(
        radius: 22,
        backgroundColor: colorScheme.outlineVariant,
        child: CircleAvatar(
          backgroundColor: scaffoldBackgroundColor,
          radius: 21,
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
