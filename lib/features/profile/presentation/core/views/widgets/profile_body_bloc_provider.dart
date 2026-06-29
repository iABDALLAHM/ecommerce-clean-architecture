import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBodyBlocProvider extends StatelessWidget {
  const ProfileBodyBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetImageCubit()),
        BlocProvider(
          create: (context) => UpdateUserImageCubit(
            imagesRepo: getIt.get<ImagesRepository>(),
            userRepository: getIt.get<UserRepository>(),
          ),
        ),

        BlocProvider(
          create: (context) =>
              SignOutCubit(authRepo: getIt.get<AuthRepository>()),
        ),
      ],
      child: child,
    );
  }
}
