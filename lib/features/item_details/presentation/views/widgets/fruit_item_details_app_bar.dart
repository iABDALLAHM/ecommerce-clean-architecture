import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FruitItemDetailsAppBar extends StatelessWidget {
  const FruitItemDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 15),
        decoration: ShapeDecoration(
          shape: OvalBorder(),
          color: colorScheme.onPrimary,
        ),
        child: Icon(
          IconData(
            Icons.arrow_back_ios_new.codePoint,
            fontFamily: Icons.arrow_back_ios_new.fontFamily,
            fontPackage: Icons.arrow_back_ios_new.fontPackage,
            matchTextDirection: true,
          ),
          size: 18,
        ),
      ),
    );
  }
}
