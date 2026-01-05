import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_register_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/register_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "Register";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(authRepo: getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildRegisterAppBar(context),
        body: RegisterViewBodyBlocConsumer(),
      ),
    );
  }
}
