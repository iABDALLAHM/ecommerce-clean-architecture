import 'package:ecommerce_clean_architecture/core/entities/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/functions/handle_date_time.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class InActiveNotificationItem extends StatelessWidget {
  const InActiveNotificationItem({super.key, required this.notificationEntity});
  final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 30,
        backgroundImage: NetworkImage(notificationEntity.notificationImageUrl!),
      ),
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
    );
  }
}
