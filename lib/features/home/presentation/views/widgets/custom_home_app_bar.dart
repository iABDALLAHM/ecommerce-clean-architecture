import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.lightPrimaryColor,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Image.network(getUserData().userImage),
          ),
        ),
        const SizedBox(width: 11),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "صباح الخير !..",
              style: AppStyles.textStyle16Regular.copyWith(
                color: Color(0xff949D9E),
              ),
            ),
            const SizedBox(height: 2),
            Text(getUserData().name, style: AppStyles.textStyle16Bold),
          ],
        ),
        Spacer(),
        CustomNotificationIcon(),
      ],
    );
  }
}
