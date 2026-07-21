import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/core/widgets/custom_password_field.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/cubits/confirm_reset_password_cubit/confirm_password_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/cubits/confirm_reset_password_cubit/confirm_password_state.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/views/widgets/confirm_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetYourPasswordViewBody extends StatefulWidget {
  const ResetYourPasswordViewBody({super.key, required this.oobCode});
  final String oobCode;

  @override
  State<ResetYourPasswordViewBody> createState() =>
      _ResetYourPasswordViewBodyState();
}

class _ResetYourPasswordViewBodyState extends State<ResetYourPasswordViewBody> {
  String newPassword = "";
  String confirmationNewPassword = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ConfirmPasswordBlocListener(
      child: BlocBuilder<ConfirmPasswordCubit, ConfirmPasswordState>(
        builder: (context, state) {
          return CustomProgressWidget(
            state: state is LoadingConfirmPasswordSate,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
                      style: AppStyles.textStyle16SemiBold,
                    ),
                    const SizedBox(height: 34),
                    CustomPasswordField(
                      hintText: "كلمة المرور الجديدة",
                      onSaved: (value) {
                        newPassword = value ?? "";
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomPasswordField(
                      hintText: "تأكيد كلمة المرور",
                      onSaved: (value) {
                        confirmationNewPassword = value ?? "";
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: CustomButton(
                        text: "إنشاء كلمة مرور جديدة",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if (newPassword != confirmationNewPassword) {
                              showSnackBar(
                                context,
                                message: "تأكيد الباسورد غير صحيح",
                              );
                            } else {
                              context
                                  .read<ConfirmPasswordCubit>()
                                  .confirmPassword(
                                    newPassword: newPassword,
                                    code: widget.oobCode,
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
          );
        },
      ),
    );
  }
}
