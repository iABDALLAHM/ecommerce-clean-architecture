import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/functions/handle_date_time.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key, required this.notificationEntity});
  final NotificationEntity notificationEntity;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            trailing: Text(
              handleDateTime(date: widget.notificationEntity.notificationDate),
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
      ],
    );
  }
}
