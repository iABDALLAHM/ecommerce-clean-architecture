import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back_app_bar.dart';
import 'package:flutter/material.dart';

AppBar buildAuthAppBar({required String title, bool isBack = true}) {
  return AppBar(
    leading: CustomArrowBackAppBar(isBack: isBack),
    title: Text(title),
  );
}
