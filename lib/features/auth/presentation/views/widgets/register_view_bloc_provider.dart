import 'package:ecommerce_clean_architecture/core/repos/user_repo/user_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/terms_and_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBlocProvider extends StatelessWidget {
  const RegisterViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            authRepo: getIt.get<AuthRepo>(),
            userRepo: getIt.get<UserRepo>(),
          ),
        ),
        BlocProvider(create: (context) => TermsAndConditionsCubit()),
      ],
      child: child,
    );
  }
}
