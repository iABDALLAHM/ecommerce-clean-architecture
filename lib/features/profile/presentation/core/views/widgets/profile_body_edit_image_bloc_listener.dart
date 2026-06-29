import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileBodyEditImageBlocListener extends StatelessWidget {
  const ProfileBodyEditImageBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserImageCubit, UpdateUserImageStates>(
      listener: (context, state) {
        if (state is SuccessUpdateUserImageState) {
          showSnackBar(context, message: "تم تغير الصورة بنجاح");
          context.pop();
        } else if (state is FailureUpdateUserImageState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      child: child,
    );
  }
}
