import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_message.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/manager/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/manager/get_notifications_cubit/get_notifications_states.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/views/widgets/custom_notification_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/views/widgets/newest_notification_body_header.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/views/widgets/newest_notifications_list_view.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/views/widgets/past_notification_body_header.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/views/widgets/past_notifications_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  void initState() {
    context.read<GetNotificationsCubit>().getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsCubit, GetNotificationsStates>(
      builder: (context, state) {
        if (state is SuccessGetNotificationsState) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      CustomNotificationAppBar(),
                      const SizedBox(height: 16),
                      NewestNotificationBodyHeader(
                        notificationLength: state.notificationList.length,
                      ),
                      const SizedBox(height: 16),
                      NewestNotificationsListView(
                        notificationList: state.notificationList,
                      ),
                      const SizedBox(height: 11),
                      PastNotificationBodyHeader(
                        notificationLength: state.notificationList.length,
                      ),
                      const SizedBox(height: 16),
                      PastNotificationsListView(
                        notificationList: state.notificationList,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is FailureGetNotificationsState) {
          return CustomTextMessage(message: state.errMessage);
        } else if (state is EmptyNotificationsState) {
          return CustomTextMessage(message: "لا يوجد لديك إشعارات");
        } else {
          return Skeletonizer(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        CustomNotificationAppBar(),
                        const SizedBox(height: 16),
                        NewestNotificationBodyHeader(notificationLength: 0),
                        const SizedBox(height: 16),
                        NewestNotificationsListView(notificationList: []),
                        const SizedBox(height: 11),
                        PastNotificationBodyHeader(notificationLength: 0),
                        const SizedBox(height: 16),
                        PastNotificationsListView(notificationList: []),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
