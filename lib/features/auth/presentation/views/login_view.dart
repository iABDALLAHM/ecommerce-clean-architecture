import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_auth_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/login_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "Login";
  @override
  Widget build(BuildContext context) {
    return LoginViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(
          title: "تسجيل دخول",
          leading: Icon(Icons.arrow_back_ios_new),
        ),
        body: LoginViewBody(),
      ),
    );
  }
}
