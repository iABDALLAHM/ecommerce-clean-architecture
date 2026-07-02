import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeProfileImage extends StatelessWidget {
  const CustomHomeProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.lightPrimaryColor,
      radius: 24,
      child: ClipOval(
        child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
          builder: (context, state) {
            if (state is SuccessGetUserDataState) {
              return Image.network(
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                state.userEntity.userImage,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person);
                },
              );
            }
            return SizedBox(width: 40, height: 40, child: Icon(Icons.person));
          },
        ),
      ),
    );
  }
}
