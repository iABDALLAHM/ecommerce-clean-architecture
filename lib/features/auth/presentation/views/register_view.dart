import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_register_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "Register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildRegisterAppBar(context),
      body: RegisterViewBody(),
    );
  }
}
