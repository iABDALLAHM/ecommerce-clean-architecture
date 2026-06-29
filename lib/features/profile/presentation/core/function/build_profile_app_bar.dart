import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildProfileAppBar(
  BuildContext context, {
  required String title,
  bool isMain = false,
}) {
  return AppBar(
    title: Text(title, style: AppStyles.textStyle19Bold),
    centerTitle: true,
    leading: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 21,
      child: GestureDetector(
        onTap: () {
          if (!isMain) {
            context.pop();
          }
        },
        child: Icon(Icons.arrow_back_ios_new, size: 20),
      ),
    ),
  );
}
