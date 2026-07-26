import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_message.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_states.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/custom_notification_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/notification_body_header.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/notifications_list_view.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({super.key});

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GetNotificationsCubit, GetNotificationsStates>(
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
                        NotificationBodyHeader(
                          notificationLength: state.notificationList.length,
                        ),
                        const SizedBox(height: 16),
                        NotificationsListView(
                          notificationList: state.notificationList,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is FailureGetNotificationsState) {
            return CustomTextMessage(message: state.errMessage);
          } else if (state is EmptyNotificationsState) {
            return CustomTextMessage(
              message: LocaleKeys.notification_doNotHaveNotifications.tr(),
            );
          } else if (state is LoadingGetNotificationsState) {
            return CustomCircularProgressWidget();
          } else {
            return Text(LocaleKeys.notification_searchingNewNotifications.tr());
          }
        },
      ),
    );
  }
}
