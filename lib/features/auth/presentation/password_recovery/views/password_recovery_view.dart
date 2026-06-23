import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/password_recovery/views/widgets/password_recovery_view_body.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAuthAppBar(title: "التحقق من الرمز"),
      body: PasswordRecoveryViewBody(),
    );
  }
}
