import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/services/auth_service.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplementation implements AuthRepo {
  final AuthService authService;
  final DatabaseService firestoreService;
  AuthRepoImplementation({
    required this.authService,
    required this.firestoreService,
  });
  @override
  Future<Either<Failure, UserEntity>> createNewAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user =
          await authService.register(email: email, password: password) as User;
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      try {
        await addUserData(userEntity: userEntity);
        return Right(userEntity);
      } catch (e) {
        authService.delete();
        log(
          "error happend in AuthRepoImplementation in createNewAccount in addUserData the error : $e",
        );
        return Left(
          ServerFailure(
            message: "حدث خطأ اثناء تسجيل البيانات برجاء المحاولة مرة آخرى",
          ),
        );
      }
    } on CustomException catch (e) {
      log(
        "error happend in AuthRepoImplementation in createNewAccount the error : $e",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var user =
          await authService.signIn(email: email, password: password) as User;
      UserEntity userEntity = await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      await SharedPrefsService.setBool(key: kIsUserSignIn, value: true);
      return Right(userEntity);
    } on CustomException catch (e) {
      log("error happend in AuthRepoImplementation in signIn the error : $e");
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<void> addUserData({required UserEntity userEntity}) async {
    await firestoreService.addData(
      path: BackendEndPoints.addUserData,
      data: UserModel.fromEntity(userEntity).toMap(),
      documentId: userEntity.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userMap = await firestoreService.getData(
      path: BackendEndPoints.getUserData,
      documentId: uId,
    );
    UserEntity user = UserModel.fromJson(userMap).toEntity();
    return user;
  }

  @override
  Future<void> saveUserData({required UserEntity userEntity}) async {
    var jsonStringData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await SharedPrefsService.saveData(
      key: kSaveUserData,
      value: jsonStringData,
    );
  }

  @override
  Future<void> removeUserData() async {
    SharedPrefsService.removeData(key: kRemoveUserData);
  }

  @override
  Future<void> signOut() async {
    await authService.signOut();
    await removeUserData();
  }
}
