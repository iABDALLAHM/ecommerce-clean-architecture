import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            "لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.",
            style: AppStyles.textStyle16SemiBold.copyWith(
              color: Color(0xff616A6B),
            ),
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            hintText: "+20 123 567 8911",
            onSaved: (value) {},
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 54,
            width: double.infinity,
            child: CustomButton(text: "نسيت كلمة المرور", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
