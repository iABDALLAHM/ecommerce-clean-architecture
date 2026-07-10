import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/functions/handle_date_time.dart';
import 'package:flutter/material.dart';

class ActiveNotificationItem extends StatefulWidget {
  const ActiveNotificationItem({super.key, required this.notificationEntity});
  final NotificationEntity notificationEntity;

  @override
  State<ActiveNotificationItem> createState() => _ActiveNotificationItemState();
}

class _ActiveNotificationItemState extends State<ActiveNotificationItem> {
  bool isRead = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isRead = true;
        setState(() {});
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: isRead == true ? Colors.white : Color(0xffEBF9F1),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              trailing: Text(
                handleDateTime(
                  date: widget.notificationEntity.notificationDate,
                ),
                style: AppStyles.textStyle13Regular.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: NetworkImage(
                  widget.notificationEntity.notificationImage,
                ),
              ),
              title: Text(widget.notificationEntity.notificationBody),
            ),
          ),
          isRead == true
              ? SizedBox()
              : Positioned(
                  top: -10,
                  right: 10,
                  child: Icon(
                    Icons.circle,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
        ],
      ),
    );
  }
}
