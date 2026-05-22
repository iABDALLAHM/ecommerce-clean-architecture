import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAuthAppBar({required String title, required Widget leading}) {
  return AppBar(
    leading: leading,
    title: Text(title, style: AppStyles.textStyle19Bold),
  );
}
