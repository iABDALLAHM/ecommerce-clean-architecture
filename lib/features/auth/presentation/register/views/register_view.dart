import 'package:ecommerce_clean_architecture/features/auth/presentation/core/functions/build_auth_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/views/widgets/register_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "Register";
  @override
  Widget build(BuildContext context) {
    return RegisterViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(title: "حساب جديد"),
        body: RegisterViewBody(),
      ),
    );
  }
}
