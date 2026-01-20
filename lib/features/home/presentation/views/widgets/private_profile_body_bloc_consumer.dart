import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/update_user_password_cubit/update_user_password_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivateProfileBodyBlocConsumer extends StatelessWidget {
  const PrivateProfileBodyBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserPasswordCubit, UpdateUserPasswordStates>(
      builder: (context, state) => child,
      listener: (context, state) {
        if (state is SuccessUpdateUserPasswordState) {
          showSnackBar(context, message: "تم تغير الباسورد بنجاح");
        } else if (state is FailureUpdateUserPasswordState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
    );
  }
}
