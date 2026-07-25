import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/login/views/widgets/login_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/login/views/widgets/login_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(
          title: LocaleKeys.auth_loginPage_loginPageAppBar.tr(),
          isBack: false,
        ),
        body: LoginViewBody(),
      ),
    );
  }
}
