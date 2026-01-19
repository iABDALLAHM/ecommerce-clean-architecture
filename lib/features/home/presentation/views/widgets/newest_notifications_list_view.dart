import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/active_notification_item.dart';
import 'package:flutter/widgets.dart';

class NewestNotificationsListView extends StatelessWidget {
  const NewestNotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ActiveNotificationItem(),
        );
      },
    );
  }
}
