import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/features/main/data/models/notification_model/notification_model.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';

class NotificationRepositoryImplementation implements NotificationRepository {
  final DatabaseService databaseService;
  NotificationRepositoryImplementation({required this.databaseService});
  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      var response = await databaseService.getData(
        path: BackendEndPoints.notificationsCollection,
      );
      List<NotificationEntity> notificationList = [];
      for (var notificationModel in response) {
        notificationList.add(
          NotificationModel.fromJson(notificationModel).toEntity(),
        );
      }
      return Right(notificationList);
    } on CustomException catch (e) {
      log("error in NotificationRepoImplementation in getNotifications $e");
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
