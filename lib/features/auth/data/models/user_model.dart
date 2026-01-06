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
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      uId: json["uId"],
    );
  }
  toMap() {
    return {"name": name, "email": email, "uId": uId};
  }

  toEntity() {
    return UserEntity(name: name, email: email, uId: uId);
  }
}
