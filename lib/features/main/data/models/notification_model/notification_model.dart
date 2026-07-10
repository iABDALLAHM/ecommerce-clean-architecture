import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/notification_entity/notification_entity.dart';

class NotificationModel {
  final String notificationBody;
  final String notificationImageUrl;
  final DateTime date;
  final String id;
  final List<String> readBy;

  NotificationModel({
    required this.notificationBody,
    required this.notificationImageUrl,
    required this.date,
    required this.id,
    required this.readBy,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      date: notificationEntity.notificationDate,
      notificationImageUrl: notificationEntity.notificationImage,
      notificationBody: notificationEntity.notificationBody,
      id: notificationEntity.id,
      readBy: notificationEntity.readBy,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      date: (json["date"] as Timestamp).toDate(),
      notificationImageUrl: json["notificationImageUrl"],
      notificationBody: json["notificationBody"],
      id: json["id"],
      readBy: json["readBy"],
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      notificationBody: notificationBody,
      notificationImage: notificationImageUrl,
      notificationDate: date,
      id: id,
      readBy: readBy,
    );
  }
}
