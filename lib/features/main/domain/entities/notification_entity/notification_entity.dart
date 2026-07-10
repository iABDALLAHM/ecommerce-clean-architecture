class NotificationEntity {
  final String notificationBody;
  final String notificationImage;
  final DateTime notificationDate;
  final String id;
  final List<String> readBy;

  NotificationEntity({
    required this.notificationBody,
    required this.notificationImage,
    required this.notificationDate,
    required this.id,
    required this.readBy,
  });

  NotificationEntity copyWith({required String? notificationImage}) {
    return NotificationEntity(
      notificationBody: notificationBody,
      notificationImage: notificationImage ?? this.notificationImage,
      notificationDate: notificationDate,
      id: id,
      readBy: readBy,
    );
  }
}
