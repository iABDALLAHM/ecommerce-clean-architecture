import 'package:ecommerce_clean_architecture/core/functions/change_text_steps.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar buildCheckOutAppBar(BuildContext context, {required int currentStep}) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(
      changeTextSteps(step: currentStep),
      style: AppStyles.textStyle19Bold,
    ),
  );
}
