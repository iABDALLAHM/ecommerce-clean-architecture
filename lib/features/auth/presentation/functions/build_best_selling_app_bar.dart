
  import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';

AppBar buildBestSellingAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CustomNotificationIcon(),
        ),
      ],
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
      title: Text("الأكثر مبيعًا", style: AppStyles.textStyle19Bold),
    );
  }