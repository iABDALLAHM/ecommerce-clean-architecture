import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/core/widgets/auth_rich_text.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/views/widgets/terms_and_conditions_section.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String email = "";
  String name = "";
  String password = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var termsAndConditionsState = context
        .watch<TermsAndConditionsCubit>()
        .state
        .isChecked;
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          _handleSuccess(context);
        } else if (state is FailureRegisterState) {
          _handleFailure(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressWidget(
          state: state is LoadingRegisterState ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: autovalidateMode,
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      hintText: LocaleKeys.auth_signUp_nameTextField.tr(),
                      onSaved: (value) {
                        name = value ?? "";
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: LocaleKeys.auth_signUp_emailTextField.tr(),
                      onSaved: (value) {
                        email = value ?? "";
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomPasswordField(
                      onSaved: (value) {
                        password = value ?? "";
                      },
                    ),
                    const SizedBox(height: 16),
                    TermsAndConditionsSection(
                      onChange: (value) {
                        context.read<TermsAndConditionsCubit>().checkButton(
                          value: value,
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: CustomButton(
                        text: LocaleKeys.auth_signUp_signUpButton.tr(),
                        onPressed: () {
                          if (termsAndConditionsState == true) {
                            _validateTextField(context);
                          } else {
                            showSnackBar(
                              context,
                              message: LocaleKeys
                                  .termsAndConditions_failureTermsAndConditionsState
                                  .tr(),
                            );
                            return;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 26),
                    AuthRichText(
                      onTap: () => context.pop(),
                      title: LocaleKeys.auth_signUp_haveAnAccount.tr(),
                      subTitle: LocaleKeys.auth_signUp_signIn.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _validateTextField(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _triggerRegisterCubit(context);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void _triggerRegisterCubit(BuildContext context) {
    context.read<RegisterCubit>().register(
      email: email,
      name: name,
      password: password,
    );
  }

  void _handleFailure(BuildContext context, {required String message}) {
    showSnackBar(context, message: message);
  }

  void _handleSuccess(BuildContext context) {
    showSnackBar(
      context,
      message: LocaleKeys.registerCubit_successRegisterState.tr(),
    );
    context.pop();
  }
}
