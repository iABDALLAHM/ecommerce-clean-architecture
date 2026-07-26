import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/cubits/send_reset_password_email_cubit/send_reset_password_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/cubits/send_reset_password_email_cubit/send_reset_password_email_state.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<
      SendResetPasswordEmailCubit,
      SendResetPasswordEmailState
    >(
      listener: (context, state) {
        if (state is SuccessSendEmailState) {
          showSnackBar(
            context,
            message: LocaleKeys
                .sendResetPasswordEmailCubit_successSendEmailState
                .tr(),
          );
        } else if (state is FailureSendEmailState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: child,
    );
  }
}
