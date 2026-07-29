import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_states.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/notification_repository/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNotificationsCubit extends Cubit<GetNotificationsStates> {
  GetNotificationsCubit({required this.notificationRepo})
    : super(InitialGetNotificationsState());

  final NotificationRepository notificationRepo;

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
