import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/views/widgets/reset_your_password_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/views/widgets/reset_your_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key, required this.oobCode});

  final String oobCode;

  @override
  Widget build(BuildContext context) {
    return ResetYourPasswordViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(title: "كلمة مرور جديدة"),
        body: ResetYourPasswordViewBody(oobCode: oobCode),
      ),
    );
  }
}
