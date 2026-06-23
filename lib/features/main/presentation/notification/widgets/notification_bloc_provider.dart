import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBlocProvider extends StatelessWidget {
  const NotificationBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotificationsCubit(
        notificationRepo: getIt.get<NotificationRepository>(),
      ),
      child: child,
    );
  }
}
