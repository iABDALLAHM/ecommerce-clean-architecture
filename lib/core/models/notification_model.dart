import 'package:ecommerce_clean_architecture/core/entities/notification_entity.dart';

class NotificationModel {
  final String notificationTitle;
  final String notificationBody;
  final int discountPercentage;
  final String notificationImageUrl;
  final DateTime date;
  NotificationModel({
    required this.notificationTitle,
    required this.notificationBody,
    required this.discountPercentage,
    required this.notificationImageUrl,
    required this.date,
  });

  factory NotificationModel.fromJson({required Map<String, dynamic> json}) {
    return NotificationModel(
      date: json["date"],
      notificationImageUrl: json["notificationimageUrl"],
      notificationTitle: json["notificationTitle"],
      notificationBody: json["notificationBody"],
      discountPercentage: json["discountPercentage"],
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      notificationTitle: notificationTitle,
      notificationBody: notificationBody,
      discountPercentage: discountPercentage,
      notificationImageUrl: notificationImageUrl,
      date: date,
    );
  }
}
