import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/notification/domain/repos/notification_repo.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/manager/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/features/notification/presentation/views/widgets/notification_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = "NotificationView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotificationsCubit(
        notificationRepo: getIt.get<NotificationRepo>(),
      ),
      child: NotificationViewBody(),
    );
  }
}
