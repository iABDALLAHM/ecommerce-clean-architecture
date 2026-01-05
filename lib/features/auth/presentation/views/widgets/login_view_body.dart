import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_password_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/forget_password_section.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/login_rich_text.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/or_divider_section.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/social_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                hintText: "البريد الإلكتروني",
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              ForgetPasswordSection(),
              const SizedBox(height: 33),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: CustomButton(
                  text: "تسجيل دخول",
                  onPressed: () {
                    validateLoginTextFields();
                  },
                ),
              ),
              const SizedBox(height: 33),
              LoginRichText(),
              const SizedBox(height: 33),
              OrDividerSection(),
              const SizedBox(height: 16),
              SocialCustomButton(
                onPressed: () {},
                text: "تسجيل بواسطة فيسبوك",
                icon: Assets.imagesFacebookSocialIcon,
              ),
              const SizedBox(height: 16),
              SocialCustomButton(
                onPressed: () {},
                text: "تسجيل بواسطة جوجل",
                icon: Assets.imagesGoogleSocialIcon,
              ),
              const SizedBox(height: 16),
              SocialCustomButton(
                onPressed: () {},
                text: "تسجيل بواسطة أبل",
                icon: Assets.imagesAppleSocialIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateLoginTextFields() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      triggerLoginCubit();
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  void triggerLoginCubit() {
    context.read<LoginCubit>().signIn(email: email, password: password);
  }
}
