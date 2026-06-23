import 'package:ecommerce_clean_architecture/features/auth/auth.dart';

abstract class UserLocalDataSource {
  Future<void> saveUserData({required UserEntity userEntity});
  Future<void> removeAllUserData();
  Future<UserEntity> getUserData();
}
