import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entity.dart';

abstract class UserLocalDataSource {
  Future<void> saveUserData({required UserEntity userEntity});
  Future<void> removeAllUserData();
  Future<UserEntity> getUserData();
}
