import 'package:ecommerce_clean_architecture/features/auth/data/repositories/user_repository/user_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/login/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBlocProvider extends StatelessWidget {
  const LoginViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        authRepo: getIt.get<AuthRepository>(),
        userRepo: getIt.get<UserRepository>(),
      ),
      child: child,
    );
  }
}
