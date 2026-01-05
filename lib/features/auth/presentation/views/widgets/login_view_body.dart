import 'package:ecommerce_clean_architecture/core/widgets/custom_password_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/forget_password_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        CustomTextFormField(hintText: "البريد الإلكتروني"),
        const SizedBox(height: 16),
        CustomPasswordField(hintText: "كلمة المرور"),
        const SizedBox(height: 16),
        ForgetPasswordSection(),
      ],
    );
  }
}
