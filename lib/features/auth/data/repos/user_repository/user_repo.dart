import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entities/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, void>> addUserData({required UserEntity userEntity});
  Future<Either<Failure, UserEntity>> getUserData({required String uId});
}
