import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';

class SearchBodyAppBar extends StatelessWidget {
  const SearchBodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xffF1F1F5), width: 1),
            ),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        Text("البحث", style: AppStyles.textStyle19Bold),
        CustomNotificationIcon(),
      ],
    );
  }
}
