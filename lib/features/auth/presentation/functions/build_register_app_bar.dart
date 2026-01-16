import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:flutter/material.dart';

AppBar buildRegisterAppBar(BuildContext context) {
  return AppBar(
    leading: CustomArrowBack(),
    title: Text("حساب جديد", style: AppStyles.textStyle19Bold),
    centerTitle: true,
  );
}
