import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/login/views/widgets/login_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/login/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(title: "تسجيل دخول", isBack: false),
        body: LoginViewBody(),
      ),
    );
  }
}
