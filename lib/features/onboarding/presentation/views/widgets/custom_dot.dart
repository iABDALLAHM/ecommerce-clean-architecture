import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11,
      height: 11,
      decoration: BoxDecoration(
        color: color ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}