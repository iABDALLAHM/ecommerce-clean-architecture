import 'dart:convert';

import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entity.dart';

UserEntity getUserData() {
  var data = SharedPrefsService.getData(key: kSaveUserData);
  UserEntity userEntity = UserModel.fromJson(jsonDecode(data!)).toEntity();
  return userEntity;
}
