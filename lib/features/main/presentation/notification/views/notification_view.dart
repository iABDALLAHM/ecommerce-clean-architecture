import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/views/widgets/notification_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = "NotificationView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotificationsCubit(
        notificationRepo: getIt.get<NotificationRepository>(),
      ),
      child: NotificationViewBody(),
    );
  }
}
