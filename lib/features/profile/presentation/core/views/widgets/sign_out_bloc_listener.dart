import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignOutDialogBlocListener extends StatelessWidget {
  const SignOutDialogBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutStates>(
      listener: (context, state) {
        if (state is SuccessSignOutState) {
          showSnackBar(context, message: "تم تسجيل الخروج من التطبيق");
          context.go(AppRoutes.onboarding);
        } else if (state is FailureSignOutState) {
          showSnackBar(context, message: state.errMessage);
        } else if (state is LoadingSignOutState) {
          showSnackBar(context, message: "يتم تسجيل الخروج");
        }
      },
      child: child,
    );
  }
}
