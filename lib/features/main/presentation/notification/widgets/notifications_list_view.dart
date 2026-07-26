import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/notification_item.dart';
import 'package:flutter/widgets.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.notificationList});
  final List<NotificationEntity> notificationList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notificationList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: NotificationItem(notificationEntity: notificationList[index]),
        );
      },
    );
  }
}
