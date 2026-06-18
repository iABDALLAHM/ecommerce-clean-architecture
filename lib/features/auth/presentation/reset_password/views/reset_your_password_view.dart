import 'package:ecommerce_clean_architecture/features/auth/presentation/core/functions/build_auth_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/views/widgets/reset_your_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key});
  static const String routeName = "ResetYourPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAuthAppBar(title: "كلمة مرور جديدة"),
      body: ResetYourPasswordViewBody(),
    );
  }
}
