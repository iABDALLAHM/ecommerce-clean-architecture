import 'package:ecommerce_clean_architecture/core/cubits/get_notifications_cubit/get_notifications_states.dart';
import 'package:ecommerce_clean_architecture/core/repos/notification_repo/notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsStates> {
  GetNotificationsCubit({required this.notificationRepo})
    : super(InitialGetNotificationsState());
  final NotificationRepo notificationRepo;

  Future getNotification() async {
    emit(LoadingGetNotificationsState());
    var result = await notificationRepo.getNotifications();
    result.fold(
      (failure) =>
          emit(FailureGetNotificationsState(errMessage: failure.message)),
      (notificationList) {
        if (notificationList.isEmpty) {
          emit(EmptyNotificationsState());
        } else {
          emit(
            SuccessGetNotificationsState(notificationList: notificationList),
          );
        }
      },
    );
  }
}
