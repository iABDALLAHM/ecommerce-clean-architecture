import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_name_cubit/update_user_name_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_password_cubit/update_user_password_states.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/change_your_email_bottom_sheet.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/change_your_name_bottom_sheet.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/custom_edit_data_text_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/user_profile_body_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key});

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String oldPassword = "";
  String newPassword = "";
  String confirmationNewPassord = "";

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return UserProfileBodyBlocListener(
      child: BlocBuilder<UpdateUserPasswordCubit, UpdateUserPasswordStates>(
        builder: (context, state) {
          return CustomProgressWidget(
            state: state is LoadingUpdateUserPasswordState,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding,
                    ),
                    child: Form(
                      autovalidateMode: autovalidateMode,
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            LocaleKeys.profile_userProfilePagePersonalInfoHeader
                                .tr(),
                            style: AppStyles.textStyle13SemiBold,
                          ),
                          const SizedBox(height: 8),
                          BlocBuilder<GetUserDataCubit, GetUserDataState>(
                            builder: (context, state) {
                              if (state is SuccessGetUserDataState) {
                                return Column(
                                  children: [
                                    CustomEditDataTextField(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: colorScheme.surface,
                                          useRootNavigator: true,
                                          context: context,
                                          builder: (_) {
                                            var updateUserNameCubit = context
                                                .read<UpdateUserNameCubit>();

                                            return BlocProvider.value(
                                              value: updateUserNameCubit,
                                              child:
                                                  ChangeYourNameBottomSheet(),
                                            );
                                          },
                                        );
                                      },
                                      hintText: state.userEntity.name,
                                    ),
                                    const SizedBox(height: 8),
                                    CustomEditDataTextField(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: colorScheme.surface,
                                          useRootNavigator: true,
                                          context: context,
                                          builder: (_) {
                                            var updateUserEmailCubit = context
                                                .read<UpdateUserEmailCubit>();

                                            return BlocProvider.value(
                                              value: updateUserEmailCubit,
                                              child:
                                                  ChangeYourEmailBottomSheet(),
                                            );
                                          },
                                        );
                                      },
                                      hintText: state.userEntity.email,
                                    ),
                                  ],
                                );
                              }
                              return Column(
                                children: [
                                  CustomEditDataTextField(
                                    hintText: LocaleKeys
                                        .profileStatus_loadingData
                                        .tr(),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(height: 8),
                                  CustomEditDataTextField(
                                    hintText: LocaleKeys
                                        .profileStatus_loadingData
                                        .tr(),
                                    onPressed: () {},
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          Text(
                            LocaleKeys
                                .profile_userProfilePageChangePasswordHeader
                                .tr(),
                            style: AppStyles.textStyle13SemiBold,
                          ),
                          const SizedBox(height: 8),
                          CustomPasswordField(
                            hintText: LocaleKeys
                                .profile_userProfilePageCurrentPasswordTextField
                                .tr(),
                            onSaved: (value) {
                              oldPassword = value ?? "";
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomPasswordField(
                            hintText: LocaleKeys
                                .profile_userProfilePageNewPassword
                                .tr(),
                            onSaved: (value) {
                              newPassword = value ?? "";
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomPasswordField(
                            hintText: LocaleKeys
                                .profile_userProfilePageConfirmationNewPassword
                                .tr(),
                            onSaved: (value) {
                              confirmationNewPassord = value ?? "";
                            },
                          ),
                          const SizedBox(height: 60),
                          SizedBox(
                            height: 54,
                            width: double.infinity,
                            child: CustomButton(
                              text: LocaleKeys.profile_userProfilePageButton
                                  .tr(),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  if (newPassword != confirmationNewPassord) {
                                    showSnackBar(
                                      context,
                                      message: LocaleKeys
                                          .profileStatus_pleaseConfirmYourPassword
                                          .tr(),
                                    );
                                  } else {
                                    context
                                        .read<UpdateUserPasswordCubit>()
                                        .updateUserPassword(
                                          oldPassword: oldPassword,
                                          newPassword: newPassword,
                                        );
                                  }
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
