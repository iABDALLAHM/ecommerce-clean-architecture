import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_widget.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';

class BestSellingAppBar extends StatelessWidget {
  const BestSellingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowWidget(),
        Text("الأكثر مبيعًا", style: AppStyles.textStyle19Bold),
        CustomNotificationIcon(notificationLength: 0),
      ],
    );
  }
}
