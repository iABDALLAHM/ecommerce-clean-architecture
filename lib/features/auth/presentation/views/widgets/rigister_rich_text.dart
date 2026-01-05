import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class RegisterRichText extends StatelessWidget {
  const RegisterRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "تمتلك حساب بالفعل؟ ",
          style: AppStyles.textStyle16SemiBold.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "تسجيل الدخول",
            style: AppStyles.textStyle16SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
