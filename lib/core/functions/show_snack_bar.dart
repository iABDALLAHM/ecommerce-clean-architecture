import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 450),
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      content: Text(message, style: AppStyles.textStyle16Bold),
    ),
  );
}
