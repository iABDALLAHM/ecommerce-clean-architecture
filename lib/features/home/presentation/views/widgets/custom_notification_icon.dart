import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/notification_body.dart';
import 'package:flutter/material.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(NotificationBody.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: ShapeDecoration(
          color: Color(0xffEEF8ED),
          shape: OvalBorder(),
        ),
        child: Icon(
          Icons.notifications_outlined,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
