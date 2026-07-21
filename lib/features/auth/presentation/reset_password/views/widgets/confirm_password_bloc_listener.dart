import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/views/functions/show_reset_password_dialog.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/cubits/confirm_reset_password_cubit/confirm_password_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/cubits/confirm_reset_password_cubit/confirm_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordBlocListener extends StatelessWidget {
  const ConfirmPasswordBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmPasswordCubit, ConfirmPasswordState>(
      listener: (context, state) {
        if (state is SuccessConfirmPasswordSate) {
          showResetPasswordDialog(context: context);
        } else if (state is FailureConfirmPasswordSate) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: child,
    );
  }
}
