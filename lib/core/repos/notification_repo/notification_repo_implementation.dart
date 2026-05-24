import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/entities/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/models/notification_model.dart';
import 'package:ecommerce_clean_architecture/core/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';

class NotificationRepoImplementation implements NotificationRepo {
  final DatabaseService databaseService;
  NotificationRepoImplementation({required this.databaseService});
  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      var response = await databaseService.getData(
        path: BackendEndPoints.notification,
      ).timeout(const Duration(seconds: 3));
      List<NotificationEntity> notificationList = [];
      for (var notificationModel in response) {
        notificationList.add(
          NotificationModel.fromJson(json: notificationModel).toEntity(),
        );
      }
      return Right(notificationList);
    } on CustomException catch (e) {
      log("error in NotificationRepoImplementation in getNotifications $e");
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
