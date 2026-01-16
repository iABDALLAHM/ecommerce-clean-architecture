import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = "ForgetPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildForgetPasswordAppBar(context),
      body: SafeArea(child: ForgetPasswordViewBody()),
    );
  }

  AppBar buildForgetPasswordAppBar(BuildContext context) {
    return AppBar(
      leading: CustomArrowBack(),
      centerTitle: true,
      title: Text("نسيان كلمة المرور", style: AppStyles.textStyle19Bold),
    );
  }
}
