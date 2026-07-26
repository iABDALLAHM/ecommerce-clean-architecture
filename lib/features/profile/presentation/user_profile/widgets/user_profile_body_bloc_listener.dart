import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_password_cubit/update_user_password_states.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserProfileBodyBlocListener extends StatelessWidget {
  const UserProfileBodyBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserPasswordCubit, UpdateUserPasswordStates>(
      listener: (context, state) {
        if (state is LoadingUpdateUserPasswordState) {
          showSnackBar(
            context,
            message: LocaleKeys.profileStatus_loadingChangeYourPassword.tr(),
          );
        } else if (state is SuccessUpdateUserPasswordState) {
          showSnackBar(
            context,
            message: LocaleKeys.profileStatus_successChangeYourPassword.tr(),
          );
          context.go(AppRoutes.login);
        } else if (state is FailureUpdateUserPasswordState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      child: child,
    );
  }
}
