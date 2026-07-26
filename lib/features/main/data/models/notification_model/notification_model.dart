import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';

class NotificationModel {
  final String notificationBody;
  final String notificationImageUrl;
  final DateTime notificationDate;
  final String notificationId;
  final bool notificationSeen;

  NotificationModel({
    required this.notificationBody,
    required this.notificationImageUrl,
    required this.notificationDate,
    required this.notificationId,
    required this.notificationSeen,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      notificationImageUrl: notificationEntity.notificationImage,
      notificationBody: notificationEntity.notificationBody,
      notificationDate: notificationEntity.notificationDate,
      notificationId: notificationEntity.notificationId,
      notificationSeen: notificationEntity.notificationSeen,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationImageUrl: json["notificationImageUrl"],
      notificationBody: json["notificationBody"],
      notificationDate: (json["notificationDate"] as Timestamp).toDate(),
      notificationId: json["notificationId"],
      notificationSeen: json["notificationSeen"],
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      notificationBody: notificationBody,
      notificationImage: notificationImageUrl,
      notificationDate: notificationDate,
      notificationId: notificationId,
      notificationSeen: notificationSeen,
    );
  }
}
