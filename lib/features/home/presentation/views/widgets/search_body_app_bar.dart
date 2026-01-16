import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';

class SearchBodyAppBar extends StatelessWidget {
  const SearchBodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowBack(),
        Text("البحث", style: AppStyles.textStyle19Bold),
        CustomNotificationIcon(),
      ],
    );
  }
}

