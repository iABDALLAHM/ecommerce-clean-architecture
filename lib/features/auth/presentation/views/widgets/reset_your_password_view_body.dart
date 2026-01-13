import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';

class ResetYourPasswordViewBody extends StatelessWidget {
  const ResetYourPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
            style: AppStyles.textStyle16SemiBold,
          ),

          const SizedBox(height: 34),
          CustomPasswordField(hintText: "*******************"),
          const SizedBox(height: 24),
          CustomPasswordField(hintText: "*******************"),
          const SizedBox(height: 24),
          SizedBox(
            height: 54,
            width: double.infinity,
            child: CustomButton(
              text: "إنشاء كلمة مرور جديدة",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
