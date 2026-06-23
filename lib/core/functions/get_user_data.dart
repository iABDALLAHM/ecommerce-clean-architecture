import 'dart:convert';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';

UserEntity getUserData() {
  var data = getIt.get<SharedPrefService>().getData(key: kSaveUserData);
  UserEntity userEntity = UserModel.fromJson(jsonDecode(data!)).toEntity(); //هنا فيه عكاية
  return userEntity;
}
