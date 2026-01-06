import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createNewAccount({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });
  Future<void> addUserData({required UserEntity userEntity});
  Future<UserEntity> getUserData({required String uId});

  Future<void> saveUserData({required UserEntity userEntity});
}
