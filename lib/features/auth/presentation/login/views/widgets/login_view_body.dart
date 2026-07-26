import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/core/widgets/auth_rich_text.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/core/widgets/or_divider_section.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/core/widgets/social_custom_button.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/views/widgets/forget_password_section.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String email = "";
  String password = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          _handleSuccess(context);
        } else if (state is FailureLoginState) {
          _handleFailure(context, message: state.errMessage);
        } else if (state is SuccessLoginWithGoogleState) {
          _handleSuccessSignInWithGoogle(context);
        } else if (state is FailureLoginWithGoogleState) {
          showSnackBar(context, message: state.errorMessage);
        } else if (state is SuccessLoginWithFacebookState) {
          _handleSuccessSignInWithFacebook(context);
        } else if (state is FailureLoginWithFacebookState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressWidget(
          state: state is LoadingLoginState
              ? true
              : false || state is LoadingLoginWithGoogleState
              ? true
              : false,
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
                      hintText: LocaleKeys.auth_loginPage_emailTextField.tr(),
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
                    ForgetPasswordSection(),
                    const SizedBox(height: 33),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: CustomButton(
                        text: LocaleKeys.auth_loginPage_loginButton.tr(),
                        onPressed: () {
                          _validateLoginTextFields();
                        },
                      ),
                    ),
                    const SizedBox(height: 33),
                    AuthRichText(
                      onTap: () => context.push(AppRoutes.register),
                      title: LocaleKeys.auth_loginPage_doNotHaveAnAccount.tr(),
                      subTitle: LocaleKeys.auth_loginPage_createNewAccount.tr(),
                    ),
                    const SizedBox(height: 33),
                    OrDividerSection(),
                    const SizedBox(height: 16),
                    SocialCustomButton(
                      onPressed: () {
                        context.read<LoginCubit>().signInWithFacebook();
                      },
                      text: LocaleKeys.auth_loginPage_signInWithFacebookButton
                          .tr(),
                      icon: Assets.imagesFacebookSocialIcon,
                    ),
                    const SizedBox(height: 16),
                    SocialCustomButton(
                      onPressed: () {
                        context.read<LoginCubit>().signInWithGoogle();
                      },
                      text: LocaleKeys.auth_loginPage_signInWithGoogleButton
                          .tr(),
                      icon: Assets.imagesGoogleSocialIcon,
                    ),
                    const SizedBox(height: 16),
                    SocialCustomButton(
                      onPressed: () {},
                      text: LocaleKeys.auth_loginPage_signInWithAppleButton
                          .tr(),
                      icon: Assets.imagesAppleSocialIcon,
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

  void _validateLoginTextFields() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _triggerLoginCubit();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void _triggerLoginCubit() {
    context.read<LoginCubit>().signIn(email: email, password: password);
  }

  void _handleFailure(BuildContext context, {required String message}) {
    showSnackBar(context, message: message);
  }

  void _handleSuccess(BuildContext context) {
    showSnackBar(
      context,
      message: LocaleKeys.loginCubit_successSignInState.tr(),
    );
    context.read<GetUserDataCubit>().getUserData();
    context.go(AppRoutes.home);
  }

  void _handleSuccessSignInWithGoogle(BuildContext context) {
    showSnackBar(
      context,
      message: LocaleKeys.loginCubit_successSignInWithGoogleState.tr(),
    );
    context.read<GetUserDataCubit>().getUserData();
    context.go(AppRoutes.home);
  }

  void _handleSuccessSignInWithFacebook(BuildContext context) {
    showSnackBar(
      context,
      message: LocaleKeys.loginCubit_successSignInWithFacebookState.tr(),
    );
    context.read<GetUserDataCubit>().getUserData();
    context.go(AppRoutes.home);
  }
}
