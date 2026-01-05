import 'package:ecommerce_clean_architecture/core/widgets/custom_password_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/terms_and_conditions_section.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        CustomTextFormField(hintText: "الاسم كامل"),
        const SizedBox(height: 16),
        CustomTextFormField(hintText: "البريد الإلكتروني"),
        const SizedBox(height: 16),
        CustomPasswordField(),
        const SizedBox(height: 16),
        TermsAndConditionsSection(),
      ],
    );
  }
}
