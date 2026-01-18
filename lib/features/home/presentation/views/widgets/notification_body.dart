import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/in_active_notification_item.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/notification_body_header.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/active_notification_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({super.key});
  static const String routeName = "NotificationView";

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  void initState() {
    context.read<GetNotificationsCubit>().getNotification();
    super.initState();
  }

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
                NotificationBodyHeader(),
                const SizedBox(height: 16),
                InActiveNotificationItem(),
                ActiveNotificationItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
