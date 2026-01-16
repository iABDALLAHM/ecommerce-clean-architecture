import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          showSnackBar(context, message: "تم تسجيل الدخول بنجاح");
          Navigator.of(context).pushReplacementNamed(MainView.routeName);
        } else if (state is FailureLoginState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressWidget(
          state: state is LoadingLoginState ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
