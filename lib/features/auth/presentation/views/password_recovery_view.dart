import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_password_recovery_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/password_recovery_view_body.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({super.key});
  static const String routeName = "PasswordRecovery";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPasswordRecoveryAppBar(context),
      body: PasswordRecoveryViewBody(),
    );
  }
}
