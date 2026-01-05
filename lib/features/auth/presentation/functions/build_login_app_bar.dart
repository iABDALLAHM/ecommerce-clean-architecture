import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar buildLoginAppBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios_new),
      centerTitle: true,
      title: Text("تسجيل دخول", style: AppStyles.textStyle19Bold),
    );
  }