import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_reset_your_password_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/reset_your_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key});
  static const String routeName = "ResetYourPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildResetYourPasswordAppBar(context),
      body: ResetYourPasswordViewBody(),
    );
  }
}
