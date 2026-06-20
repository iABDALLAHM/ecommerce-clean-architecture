import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordSection extends StatelessWidget {
  const ForgetPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.go(AppRoutes.forgetPassword);
          },
          child: Text(
            "نسيت كلمة المرور؟",
            style: AppStyles.textStyle13SemiBold.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
