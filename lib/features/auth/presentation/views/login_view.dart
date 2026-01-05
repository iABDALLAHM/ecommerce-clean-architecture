import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_login_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "Login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildLoginAppBar(), body: LoginViewBody());
  }
}
