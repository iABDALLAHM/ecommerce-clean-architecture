import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/change_text_steps.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildCheckOutAppBar(BuildContext context, {required int currentStep}) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(
      changeTextSteps(step: currentStep),
      style: AppStyles.textStyle19Bold,
    ),
  );
}
