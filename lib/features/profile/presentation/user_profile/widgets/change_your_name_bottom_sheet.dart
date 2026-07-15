import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_name_cubit/update_user_name_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_name_cubit/update_user_name_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/change_your_name_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeYourNameBottomSheet extends StatefulWidget {
  const ChangeYourNameBottomSheet({super.key});

  @override
  State<ChangeYourNameBottomSheet> createState() =>
      _ChangeYourNameBottomSheetState();
}

class _ChangeYourNameBottomSheetState extends State<ChangeYourNameBottomSheet> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String newName = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ChangeYourNameBlocListener(
        child: BlocBuilder<UpdateUserNameCubit, UpdateUserNameState>(
          builder: (context, state) {
            return CustomProgressWidget(
              state: state is LoadingUpdateUserNameState,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          "تغير الإسم الخاص بك",
                          style: AppStyles.textStyle16SemiBold,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          hintText: "اكتب الإسم الجديد",
                          onSaved: (value) {
                            newName = value ?? "";
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 49,
                          width: double.infinity,
                          child:
                              BlocBuilder<GetUserDataCubit, GetUserDataState>(
                                builder: (context, state) {
                                  if (state is SuccessGetUserDataState) {
                                    return CustomButton(
                                      text: "تأكيد تغير الإسم",
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          final UserEntity userEntity =
                                              UserEntity(
                                                name: newName,
                                                email: state.userEntity.email,
                                                uId: state.userEntity.uId,
                                                userImage:
                                                    state.userEntity.userImage,
                                              );
                                          context
                                              .read<UpdateUserNameCubit>()
                                              .updateUserName(
                                                userEntity: userEntity,
                                              );
                                        } else {
                                          autovalidateMode =
                                              AutovalidateMode.always;
                                          setState(() {});
                                        }
                                      },
                                    );
                                  }
                                  return SizedBox();
                                },
                              ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

