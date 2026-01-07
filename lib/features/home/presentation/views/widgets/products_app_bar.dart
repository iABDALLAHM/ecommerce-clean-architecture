import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text("المنتجات", style: AppStyles.textStyle19Bold),
        Spacer(),
        CustomNotificationIcon(),
      ],
    );
  }
}