import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/in_active_notification_item.dart';
import 'package:flutter/widgets.dart';

class PastNotificationsListView extends StatelessWidget {
  const PastNotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:5,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InActiveNotificationItem(),
        );
      },
    );
  }
}
