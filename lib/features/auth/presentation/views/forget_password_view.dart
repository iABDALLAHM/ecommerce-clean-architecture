import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
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
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(0xffF1F1F5), width: 1),
          ),
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      centerTitle: true,
      title: Text("نسيان كلمة المرور", style: AppStyles.textStyle19Bold),
    );
  }
}
