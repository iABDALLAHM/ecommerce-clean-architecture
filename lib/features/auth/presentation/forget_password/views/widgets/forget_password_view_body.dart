import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/cubits/send_reset_password_email_cubit/send_reset_password_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/cubits/send_reset_password_email_cubit/send_reset_password_email_state.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/views/widgets/forget_password_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ForgetPasswordBlocListener(
      child:
          BlocBuilder<SendResetPasswordEmailCubit, SendResetPasswordEmailState>(
            builder: (context, state) {
              return CustomProgressWidget(
                state: state is LoadingSendEmailState,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: Form(
                    autovalidateMode: autovalidateMode,
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          LocaleKeys.auth_forgetPassword_forgetPasswordCondition
                              .tr(),
                          style: AppStyles.textStyle16SemiBold.copyWith(
                            color: colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomTextFormField(
                          hintText: LocaleKeys
                              .auth_forgetPassword_emailTextField
                              .tr(),
                          onSaved: (value) {
                            email = value ?? "";
                          },
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 54,
                          width: double.infinity,
                          child: CustomButton(
                            text: LocaleKeys
                                .auth_forgetPassword_forgetPasswordButton
                                .tr(),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context
                                    .read<SendResetPasswordEmailCubit>()
                                    .sendResetEmail(email: email);
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
