import 'package:flutter/material.dart';

class FruitItemDetailsAppBar extends StatelessWidget {
  const FruitItemDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: ShapeDecoration(shape: OvalBorder(), color: Colors.white),
        child: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
