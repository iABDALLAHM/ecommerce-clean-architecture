import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_terms_and_conditions_button.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsSection extends StatelessWidget {
  const TermsAndConditionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CustomTermsAndConditionsButton(),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "من خلال إنشاء حساب ، فإنك توافق على ",
                  style: AppStyles.textStyle13SemiBold.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  text: "الشروط والأحكام الخاصة بنا",
                  style: AppStyles.textStyle13SemiBold.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}