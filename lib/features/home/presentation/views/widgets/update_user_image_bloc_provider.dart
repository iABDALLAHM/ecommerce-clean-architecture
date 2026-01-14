import 'package:ecommerce_clean_architecture/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserImageBlocProvider extends StatelessWidget {
  const UpdateUserImageBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateUserImageCubit(imagesRepo: getIt.get<ImagesRepo>()),
      child: child,
    );
  }
}
