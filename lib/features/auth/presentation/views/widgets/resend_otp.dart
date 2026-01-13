import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ResendOtp extends StatelessWidget {
  const ResendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "إعادة إرسال الرمز",
          style: AppStyles.textStyle16SemiBold.copyWith(
            color: AppColors.lightPrimaryColor,
          ),
        ),
      ],
    );
  }
}
