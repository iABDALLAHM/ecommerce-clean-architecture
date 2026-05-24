import 'package:ecommerce_clean_architecture/core/entities/notification_entity.dart';

abstract class GetNotificationsStates {}

final class InitialGetNotificationsState extends GetNotificationsStates {}

final class SuccessGetNotificationsState extends GetNotificationsStates {
  final List<NotificationEntity> notificationList;
  SuccessGetNotificationsState({required this.notificationList});
}

final class LoadingGetNotificationsState extends GetNotificationsStates {}

final class FailureGetNotificationsState extends GetNotificationsStates {
  final String errMessage;
  FailureGetNotificationsState({required this.errMessage});
}

final class EmptyNotificationsState extends GetNotificationsStates {}
