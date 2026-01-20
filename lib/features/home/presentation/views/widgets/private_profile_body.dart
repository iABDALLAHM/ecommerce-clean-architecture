import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_password_field.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_edit_data_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivateProfileBody extends StatefulWidget {
  const PrivateProfileBody({super.key});

  @override
  State<PrivateProfileBody> createState() => _PrivateProfileBodyState();
}

class _PrivateProfileBodyState extends State<PrivateProfileBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? oldPassword, newPassword;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                      oldPassword = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordField(
                    hintText: "كلمة المرور الجديده",
                    onSaved: (value) {
                      newPassword = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordField(hintText: "تأكيد كلمة المرور الجديده"),
                  const SizedBox(height: 60),
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: CustomButton(
                      text: "حفظ التغييرات",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context
                              .read<UpdateUserPasswordCubit>()
                              .updateUserPassword(newPassword: newPassword!);
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
    );
  }
}
