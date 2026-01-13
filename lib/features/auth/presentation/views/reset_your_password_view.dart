import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/reset_your_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key});
  static const String routeName = "ResetYourPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildResetYourPasswordAppBar(context),
      body: ResetYourPasswordViewBody(),
    );
  }

  AppBar buildResetYourPasswordAppBar(BuildContext context) {
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
      title: Text("كلمة مرور جديدة", style: AppStyles.textStyle19Bold),
    );
  }
}
