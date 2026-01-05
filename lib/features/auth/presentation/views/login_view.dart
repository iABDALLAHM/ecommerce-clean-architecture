import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_login_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "Login";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildLoginAppBar(),
        body: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          showSnackBar(context, message: "تم تسجيل الدخول بنجاح");
        } else if (state is FailureLoginState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return LoginViewBody();
      },
    );
  }
}
