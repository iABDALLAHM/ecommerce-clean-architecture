import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton({
    super.key,
    required this.hintText,
    required this.onPressed,
    required this.isPrimary,
  });
  final String hintText;
  final Function() onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isPrimary ? AppColors.primaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        hintText,
        style: AppStyles.textStyle16Bold.copyWith(
          color: isPrimary ? Colors.white : AppColors.primaryColor,
        ),
      ),
    );
  }
}
