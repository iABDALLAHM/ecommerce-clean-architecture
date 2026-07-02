import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_states.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/image_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_edit_image_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBodyEditImageBottomSheet extends StatelessWidget {
  const ProfileBodyEditImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var newImage = context.watch<GetImageCubit>().state.image;
    return ProfileBodyEditImageBlocListener(
      child: BlocBuilder<UpdateUserImageCubit, UpdateUserImageStates>(
        builder: (context, state) {
          if (state is LoadingUpdateUserImageState) {
            return CustomProgressWidget(
              state: true,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageField(),
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 54,
                        width: MediaQuery.sizeOf(context).width * .6,
                        child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
                          builder: (context, state) {
                            if (state is SuccessGetUserDataState) {
                              return CustomButton(
                                text: "تعديل الصورة",
                                onPressed: () {
                                  context
                                      .read<UpdateUserImageCubit>()
                                      .updateUserImage(
                                        image: newImage,
                                        userUpdatedData: state.userEntity,
                                      );
                                },
                              );
                            }
                            return SizedBox();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "الصورة الحالية :",
                          style: AppStyles.textStyle13Bold,
                        ),
                        BlocBuilder<GetUserDataCubit, GetUserDataState>(
                          builder: (context, state) {
                            if (state is SuccessGetUserDataState) {
                              return Image.network(
                                state.userEntity.userImage,
                                width: 100,
                                height: 100,
                              );
                            }
                            return SizedBox(
                              width: 100,
                              height: 100,
                              child: Icon(Icons.person),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ImageField(),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 54,
                    width: MediaQuery.sizeOf(context).width * .6,
                    child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
                      builder: (context, state) {
                        if (state is SuccessGetUserDataState) {
                          return CustomButton(
                            text: "تعديل الصورة",
                            onPressed: () {
                              context
                                  .read<UpdateUserImageCubit>()
                                  .updateUserImage(
                                    image: newImage,
                                    userUpdatedData: state.userEntity,
                                  );
                            },
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
