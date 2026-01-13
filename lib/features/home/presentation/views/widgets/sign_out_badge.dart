import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/function/show_my_dialog.dart';
import 'package:flutter/material.dart';

class SignOutBadge extends StatelessWidget {
  const SignOutBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xffEBF9F1),
      child: Row(
        children: [
          Spacer(flex: 2),
          Text(
            "تسجيل الخروج",
            style: AppStyles.textStyle13SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showMyDialog(context: context);
            },
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.logout, color: AppColors.lightPrimaryColor),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
