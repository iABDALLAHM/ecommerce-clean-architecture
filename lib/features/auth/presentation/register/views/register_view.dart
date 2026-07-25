import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/views/widgets/register_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/views/widgets/register_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return RegisterViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(
          title: LocaleKeys.auth_signUp_signUpPageAppBar.tr(),
        ),
        body: RegisterViewBody(),
      ),
    );
  }
}
