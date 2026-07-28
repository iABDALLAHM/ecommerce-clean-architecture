import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_states.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/image_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_edit_image_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBodyEditImageBottomSheet extends StatefulWidget {
  const ProfileBodyEditImageBottomSheet({super.key});

  @override
  State<ProfileBodyEditImageBottomSheet> createState() =>
      _ProfileBodyEditImageBottomSheetState();
}

class _ProfileBodyEditImageBottomSheetState
    extends State<ProfileBodyEditImageBottomSheet> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    var colorScheme = Theme.of(context).colorScheme;
    var newImage = context.watch<GetImageCubit>().state.image;

    return ProfileBodyEditImageBlocListener(
      child: BlocBuilder<UpdateUserImageCubit, UpdateUserImageStates>(
        builder: (context, state) {
          return CustomProgressWidget(
            state: state is LoadingUpdateUserImageState,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(color: colorScheme.surface),
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
                              text: LocaleKeys.profileStatus_editPhotoButton
                                  .tr(),
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
        },
      ),
    );
  }
}
