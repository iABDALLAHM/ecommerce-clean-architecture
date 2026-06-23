import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/functions/handle_date_time.dart';
import 'package:flutter/material.dart';

class ActiveNotificationItem extends StatelessWidget {
  const ActiveNotificationItem({super.key, required this.notificationEntity});
  final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Color(0xffEBF9F1),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              trailing: Text(
                handleDateTime(date: notificationEntity.date),
                style: AppStyles.textStyle13Regular.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: NetworkImage(
                  notificationEntity.notificationImageUrl,
                ),
              ),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "خصم ",
                      style: AppStyles.textStyle13SemiBold,
                    ),
                    TextSpan(
                      text: "50%",
                      style: AppStyles.textStyle13SemiBold.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: " علي اسعار الفواكه بمناسبه ",
                      style: AppStyles.textStyle13SemiBold,
                    ),
                    TextSpan(
                      text: "العيد",
                      style: AppStyles.textStyle13SemiBold,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            right: 10,
            child: Icon(Icons.circle, color: AppColors.primaryColor, size: 20),
          ),
        ],
      ),
    );
  }
}
