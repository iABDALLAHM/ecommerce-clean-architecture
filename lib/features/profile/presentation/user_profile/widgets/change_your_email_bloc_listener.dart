import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangeYourEmailBlocListener extends StatelessWidget {
  const ChangeYourEmailBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserEmailCubit, UpdateUserEmailState>(
      listener: (context, state) {
        if (state is SuccessUpdateUserEmailState) {
          showSnackBar(
            context,
            message: "برجاء تفقد بريدك الإلكتروني لتاكيد تغير الإيميل",
          );
          context.read<GetUserDataCubit>().getUserData();
          context.pop();
        } else if (state is FailureUpdateUserEmailState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: child,
    );
  }
}
