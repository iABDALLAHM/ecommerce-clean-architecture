import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          showSnackBar(context, message: "تم تسجيل الدخول بنجاح");
          Navigator.pop(context);
        } else if (state is FailureRegisterState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return RegisterViewBody();
      },
    );
  }
}
