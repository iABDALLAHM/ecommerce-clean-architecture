import 'package:ecommerce_clean_architecture/core/entities/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/functions/handle_date_time.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveNotificationItem extends StatelessWidget {
  const ActiveNotificationItem({super.key, required this.notificationEntity});
  final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Color(0xffEBF9F1),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            trailing: Column(
              children: [
                const SizedBox(height: 8),
                Text(
                  handleDateTime(date: notificationEntity.date),
                  style: AppStyles.textStyle13Regular.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
              ],
            ),
            leading: SvgPicture.asset(Assets.imagesNotificationImage),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${notificationEntity.notificationTitle} ",
                        style: AppStyles.textStyle13SemiBold,
                      ),
                      TextSpan(
                        text: "${notificationEntity.discountPercentage}% ",
                        style: AppStyles.textStyle16SemiBold.copyWith(
                          color: Color(0xffEB5757),
                        ),
                      ),
                      TextSpan(
                        text: "${notificationEntity.notificationBody}",
                        style: AppStyles.textStyle13SemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: 10,
          child: Icon(Icons.circle, color: AppColors.primaryColor, size: 20),
        ),
      ],
    );
  }
}
