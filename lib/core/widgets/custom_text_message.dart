import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextMessage extends StatelessWidget {
  const CustomTextMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppStyles.textStyle19Bold.copyWith(
          color: AppColors.lightPrimaryColor,
        ),
      ),
    );
  }
}
