import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/password_recovery/views/widgets/custom_otp_box.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/password_recovery/views/widgets/resend_otp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryViewBody extends StatelessWidget {
  const PasswordRecoveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            "أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Maxxx@email.com",
            style: AppStyles.textStyle16SemiBold.copyWith(
              color: AppColors.forgetPasswordTextColor,
            ),
          ),
          const SizedBox(height: 29),
          Row(
            children: [
              Expanded(child: CustomOtpBox()),
              const SizedBox(width: 15),
              Expanded(child: CustomOtpBox()),
              const SizedBox(width: 15),
              Expanded(child: CustomOtpBox()),
              const SizedBox(width: 15),
              Expanded(child: CustomOtpBox()),
            ],
          ),
          const SizedBox(height: 29),
          SizedBox(
            height: 54,
            width: double.infinity,
            child: CustomButton(
              text: "تحقق من الرمز",
              onPressed: () {
                context.push(AppRoutes.resetYourPassword);
              },
            ),
          ),
          const SizedBox(height: 24),
          ResendOtp(),
        ],
      ),
    );
  }
}
