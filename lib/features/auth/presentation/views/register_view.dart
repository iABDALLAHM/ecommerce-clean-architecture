import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_auth_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/register_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "Register";
  @override
  Widget build(BuildContext context) {
    return RegisterViewBlocProvider(
      child: Scaffold(
        appBar: buildAuthAppBar(leading: CustomArrowBack(), title: "حساب جديد"),
        body: RegisterViewBody(),
      ),
    );
  }
}
