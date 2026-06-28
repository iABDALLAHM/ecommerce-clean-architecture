import 'package:flutter/material.dart';

class ChoosePaymentCardOption extends StatelessWidget {
  const ChoosePaymentCardOption({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xffD6DCE5)),
      ),
      child: Image.asset(image, width: 67, height: 43),
    );
  }
}
