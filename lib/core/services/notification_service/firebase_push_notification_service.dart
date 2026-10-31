import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/services/notification_service/push_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PushNotificationService)
class FirebasePushNotificationService implements PushNotificationService {
  FirebasePushNotificationService({
    required FirebaseMessaging firebaseMessaging,
  }) : _firebaseMessaging = firebaseMessaging;

  final FirebaseMessaging _firebaseMessaging;

  @override
  Future<String?> getDeviceToken() async {
    try {
      await _firebaseMessaging.requestPermission();
      String? token = await _firebaseMessaging.getToken();
      return token;
    } catch (e) {
      throw CustomException(exceptionMeassge: "فشل في إن شاء token $e");
    }
  }
}
