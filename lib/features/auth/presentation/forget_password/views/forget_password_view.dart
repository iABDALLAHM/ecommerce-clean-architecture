import 'package:ecommerce_clean_architecture/features/auth/presentation/core/functions/build_auth_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAuthAppBar(title: "نسيان كلمة المرور"),
      body: SafeArea(child: ForgetPasswordViewBody()),
    );
  }
}
