import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:flutter/material.dart';

AppBar buildForgetPasswordAppBar(BuildContext context) {
  return AppBar(
    leading: CustomArrowBack(),
    centerTitle: true,
    title: Text("نسيان كلمة المرور", style: AppStyles.textStyle19Bold),
  );
}
