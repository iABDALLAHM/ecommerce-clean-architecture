import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/cubits/confirm_reset_password_cubit/confirm_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetYourPasswordViewBlocProvider extends StatelessWidget {
  const ResetYourPasswordViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ConfirmPasswordCubit(authRepository: getIt.get<AuthRepository>()),
      child: child,
    );
  }
}
