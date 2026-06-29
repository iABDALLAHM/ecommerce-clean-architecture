import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/custom_edit_data_text_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/user_profile_body_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key});

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String oldPassword = "";
  String newPassword = "";
  String confirmationNewPassord = "";

  @override
  Widget build(BuildContext context) {
    return UserProfileBodyBlocListener(
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
                      "المعلومات الشخصيه",
                      style: AppStyles.textStyle13SemiBold,
                    ),
                    const SizedBox(height: 8),
                    CustomEditDataTextField(hintText: getUserData().name),
                    const SizedBox(height: 8),
                    CustomEditDataTextField(hintText: getUserData().email),
                    const SizedBox(height: 16),
                    Text(
                      "تغيير كلمة المرور",
                      style: AppStyles.textStyle13SemiBold,
                    ),
                    const SizedBox(height: 8),
                    CustomPasswordField(
                      hintText: "كلمة المرور الحالي",
                      onSaved: (value) {
                        oldPassword = value ?? "";
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomPasswordField(
                      hintText: "كلمة المرور الجديده",
                      onSaved: (value) {
                        newPassword = value ?? "";
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomPasswordField(
                      hintText: "تأكيد كلمة المرور الجديده",
                      onSaved: (value) {
                        confirmationNewPassord = value ?? "";
                      },
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: CustomButton(
                        text: "حفظ التغييرات",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if (newPassword != confirmationNewPassord) {
                              showSnackBar(
                                context,
                                message: "برجاء تأكيد الباسورد",
                              );
                            } else {
                              context
                                  .read<UpdateUserPasswordCubit>()
                                  .updateUserPassword(newPassword: newPassword);
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
  }
}
