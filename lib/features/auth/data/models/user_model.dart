import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String name, email, uId;

  UserModel({required this.name, required this.email, required this.uId});

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      uId: userEntity.uId,
    );
  }

  toMap() {
    return {"name": name, "email": email, "uId": uId};
  }
}
