import 'package:ecommerce_clean_architecture/features/auth/data/repositories/user_repository/user_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/cubits/register_cubit/register_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/cubits/terms_and_conditions_cubit/terms_and_conditions_cubit.dart';
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
            authRepo: getIt.get<AuthRepository>(),
            userRepo: getIt.get<UserRepository>(),
          ),
        ),
        BlocProvider(create: (context) => TermsAndConditionsCubit()),
      ],
      child: child,
    );
  }
}
