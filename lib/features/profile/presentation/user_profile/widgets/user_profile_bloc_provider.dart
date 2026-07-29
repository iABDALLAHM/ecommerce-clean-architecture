import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_name_cubit/update_user_name_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBlocProvider extends StatelessWidget {
  const UserProfileBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<UpdateUserPasswordCubit>()),
        BlocProvider(create: (context) => getIt<UpdateUserEmailCubit>()),
        BlocProvider(create: (context) => getIt<UpdateUserNameCubit>()),
      ],
      child: child,
    );
  }
}
