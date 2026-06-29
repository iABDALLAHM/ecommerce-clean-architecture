import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';

class UserRepositoryImplementation implements UserRepository {
  final DatabaseService databaseService;
  final UserLocalDataSource localDataSource;

  UserRepositoryImplementation({
    required this.databaseService,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> addUserData({
    required UserEntity userEntity,
  }) async {
    try {
      await databaseService.addSingleData(
        path: BackendEndPoints.addUserData,
        data: UserModel.fromEntity(userEntity).toMap(),
        documentId: userEntity.uId,
      );
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in UserRepoImplementation in addUserData the error : $e",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserData({required String uId}) async {
    try {
      var userMap = await databaseService.getSingleData(
        path: BackendEndPoints.getUserData,
        documentId: uId,
      );

      UserEntity user = UserModel.fromJson(userMap).toEntity();
      localDataSource.saveUserData(userEntity: user);
      return Right(user);
    } on CustomException catch (e) {
      log(
        "error happend in UserRepoImplementation in getUserData the error : $e",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserData({
    required UserEntity userEntity,
  }) async {
    try {
      await databaseService.updateDate(
        data: UserModel.fromEntity(userEntity).toMap(),
        path: BackendEndPoints.addUserData,
        documentId: userEntity.uId,
      );
      
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in UserRepoImplementation in updateUserData the error : $e",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
