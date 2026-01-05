import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_password_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/rigister_rich_text.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/terms_and_conditions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late String email, name, password;
  bool termsAndConditions = false;
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
                hintText: "الاسم كامل",
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 16),
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
              TermsAndConditionsSection(
                onChange: (value) {
                  termsAndConditions = value;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: CustomButton(
                  text: "إنشاء حساب جديد",
                  onPressed: () {
                    if (termsAndConditions == false) {
                      showSnackBar(
                        context,
                        message: "من فضلك وافق على الشروط والأحكام",
                      );
                    } else {
                      validateTextField(context);
                    }
                  },
                ),
              ),
              const SizedBox(height: 26),
              RegisterRichText(),
            ],
          ),
        ),
      ),
    );
  }

  void validateTextField(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      triggerRegisterCubit(context);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void triggerRegisterCubit(BuildContext context) {
    context.read<RegisterCubit>().register(
      email: email,
      name: name,
      password: password,
    );
  }
}
