import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/features/notification/domain/entities/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();
}
