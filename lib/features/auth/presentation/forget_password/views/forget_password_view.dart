import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/views/widgets/forget_password_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/views/widgets/forget_password_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgetPasswordViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(
          title: LocaleKeys.auth_forgetPassword_forgetPasswordPageAppBar.tr(),
        ),
        body: SafeArea(child: ForgetPasswordViewBody()),
      ),
    );
  }
}
