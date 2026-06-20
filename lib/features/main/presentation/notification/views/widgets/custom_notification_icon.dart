import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("${AppRoutes.home}${AppRoutes.notifications}");
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
