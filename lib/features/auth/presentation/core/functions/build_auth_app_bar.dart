import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:flutter/material.dart';

AppBar buildAuthAppBar({required String title}) {
  return AppBar(
    leading: CustomArrowBack(),
    title: Text(title, style: AppStyles.textStyle19Bold),
  );
}
