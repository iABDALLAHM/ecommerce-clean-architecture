import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repos/user_repository/user_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/datasources/local/user_local_data_source.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entities/user_entity.dart';

class UserRepoImplementation implements UserRepo {
  final DatabaseService databaseService;
  final UserLocalDataSource localDataSource;
  UserRepoImplementation({
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
}
