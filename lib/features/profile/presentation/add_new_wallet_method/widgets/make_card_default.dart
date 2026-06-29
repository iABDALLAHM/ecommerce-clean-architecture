import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MakeCardAsDefault extends StatelessWidget {
  const MakeCardAsDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          "جعل البطاقة افتراضية",
          style: AppStyles.textStyle13SemiBold.copyWith(
            color: Color(0xff616A6B),
          ),
        ),
      ],
    );
  }
}
