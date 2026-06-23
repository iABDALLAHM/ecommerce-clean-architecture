import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/custom_home_profile_image.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomHomeProfileImage(),
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
        CustomNotificationIcon(notificationLength: 1),
      ],
    );
  }
}
