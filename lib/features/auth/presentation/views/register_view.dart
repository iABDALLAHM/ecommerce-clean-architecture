import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_auth_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/terms_and_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/register_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "Register";
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(authRepo: getIt.get<AuthRepo>()),
        ),
        BlocProvider(create: (context) => TermsAndConditionsCubit()),
      ],
      child: Scaffold(
        appBar: buildAuthAppBar(leading: CustomArrowBack(), title: "حساب جديد"),
        body: RegisterViewBodyBlocConsumer(),
      ),
    );
  }
}
