import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressWidget extends StatelessWidget {
  const CustomCircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}
