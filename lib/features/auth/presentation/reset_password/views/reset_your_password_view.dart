import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/views/widgets/reset_your_password_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/views/widgets/reset_your_password_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key, required this.oobCode});

  final String oobCode;

  @override
  Widget build(BuildContext context) {
    return ResetYourPasswordViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(
          title: LocaleKeys.auth_resetYourPassword_resetYourPasswordPageAppBar
              .tr(),
        ),
        body: ResetYourPasswordViewBody(oobCode: oobCode),
      ),
    );
  }
}
