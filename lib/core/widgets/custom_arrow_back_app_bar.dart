import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowBackAppBar extends StatelessWidget {
  const CustomArrowBackAppBar({super.key, this.isBack = true});
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () {
        if (isBack) {
          context.pop();
        }
      },
      child: CircleAvatar(
        backgroundColor: colorScheme.outlineVariant,
        radius: 20,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 27,
          child: Icon(
            IconData(
              Icons.arrow_back_ios_new.codePoint,
              fontFamily: Icons.arrow_back_ios_new.fontFamily,
              fontPackage: Icons.arrow_back_ios_new.fontPackage,
              matchTextDirection: true,
            ),
            size: 18,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
