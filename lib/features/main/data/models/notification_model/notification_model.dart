import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';

class NotificationModel {
  final String notificationBody;
  final String notificationImageUrl;
  final DateTime notificationDate;
  final String notificationId;

  NotificationModel({
    required this.notificationBody,
    required this.notificationImageUrl,
    required this.notificationDate,
    required this.notificationId,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      notificationImageUrl: notificationEntity.notificationImage,
      notificationBody: notificationEntity.notificationBody,
      notificationDate: notificationEntity.notificationDate,
      notificationId: notificationEntity.notificationId,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationImageUrl: json["notificationImageUrl"],
      notificationBody: json["notificationBody"],
      notificationDate: json["notificationDate"],
      notificationId: json["notificationId"],
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      notificationBody: notificationBody,
      notificationImage: notificationImageUrl,
      notificationDate: notificationDate,
      notificationId: notificationId,
    );
  }
}
