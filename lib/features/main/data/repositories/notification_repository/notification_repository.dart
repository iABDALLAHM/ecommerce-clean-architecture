import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();
}
