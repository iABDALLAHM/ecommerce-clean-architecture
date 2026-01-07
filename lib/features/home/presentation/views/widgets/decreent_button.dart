import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: ShapeDecoration(
          color: Color(0xffF1F1F5),
          shape: OvalBorder(),
        ),
        child: Icon(Icons.remove, color: Color(0xff979899)),
      ),
    );
  }
}