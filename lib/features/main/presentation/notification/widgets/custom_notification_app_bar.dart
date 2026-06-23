import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_widget.dart';
import 'package:flutter/material.dart';

class CustomNotificationAppBar extends StatelessWidget {
  const CustomNotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowWidget(),
        Spacer(),
        Text("الاشعارات", style: AppStyles.textStyle19Bold),
        Spacer(flex: 2),
      ],
    );
  }
}
