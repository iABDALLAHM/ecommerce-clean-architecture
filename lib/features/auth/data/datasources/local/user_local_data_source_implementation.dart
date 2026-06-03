import 'dart:convert';

import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/datasources/local/user_local_data_source.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entity.dart';

class UserLocalDataSourceImplementation implements UserLocalDataSource {
  @override
  Future<void> saveUserData({required UserEntity userEntity}) async {
    var jsonStringData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await getIt.get<SharedPrefService>().saveData(
      key: kSaveUserData,
      value: jsonStringData,
    );
  }

  @override
  Future<void> removeAllUserData() async {
    await getIt.get<SharedPrefService>().removeData(key: kRemoveUserData);
    await getIt.get<SharedPrefService>().removeBool(key: kRemoveOnBoardingSeen);
    await getIt.get<SharedPrefService>().removeBool(key: kRemoveUserSignIn);
  }

  @override
  Future<UserEntity> getUserData() async {
    var data = getIt.get<SharedPrefService>().getData(key: kSaveUserData);
    UserEntity userEntity = UserModel.fromJson(
      jsonDecode(data!),
    ).toEntity(); //هنا فيه عكاية
    return userEntity;
  }
}
