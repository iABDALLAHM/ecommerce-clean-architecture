import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_app_bar.dart';
import 'package:flutter/widgets.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});
  static const String routeName = "NotificationView";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 16),
                CustomNotificationAppBar(),
                   const SizedBox(height: 16),


                   
              ],
            ),
          ),
        ),
      ],
    );
  }
}
