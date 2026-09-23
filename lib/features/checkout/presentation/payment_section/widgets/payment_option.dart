import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption({
    super.key,
    required this.paymentMethodImage,
    required this.isSelected,
    required this.onTap,
  });
  final String paymentMethodImage;
  final bool isSelected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: isSelected ? colorScheme.primary : colorScheme.surface,
          ),
        ),
        width: 70,
        height: 50,
        child: Center(child: Image.asset(paymentMethodImage)),
      ),
    );
  }
}
