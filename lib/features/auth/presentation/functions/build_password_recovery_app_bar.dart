import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar buildPasswordRecoveryAppBar(BuildContext context) {
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
      title: Text("التحقق من الرمز", style: AppStyles.textStyle19Bold),
    );
  }