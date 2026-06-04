import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/update_user_image_cubit/update_user_image_states.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/image_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEditImageButtonSheet extends StatelessWidget {
  const CustomEditImageButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserImageCubit, UpdateUserImageStates>(
      listener: (context, state) {
        if (state is SuccessUpdateUserImageState) {
          showSnackBar(context, message: "تم رفع الصورة بنجاح");
          Navigator.pop(context);
        } else if (state is FailureUpdateUserImageState) {
          showSnackBar(context, message: state.errMessage);
        } else if (state is LoadingUpdateUserImageState) {
          showSnackBar(context, message: "جاري رفع الصورة");
        }
      },
      builder: (context, state) {
        return CustomProgressWidget(
          state: state is LoadingUpdateUserImageState ? true : false,
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
                    child: CustomButton(
                      text: "تعديل الصورة",
                      onPressed: () {
                        String imagePath =
                            context.read<GetImageCubit>().state.image ?? "";
                        if (imagePath.isNotEmpty) {
                          _triggerUpdateUserImageCubit(
                            context,
                            imagePath: imagePath,
                          );
                        } else {
                          showSnackBar(
                            context,
                            message: "من فضلك ارفع الصورة اولا",
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _triggerUpdateUserImageCubit(
    BuildContext context, {
    required String imagePath,
  }) {
    context.read<UpdateUserImageCubit>().updateUserImage(image: imagePath);
  }
}
