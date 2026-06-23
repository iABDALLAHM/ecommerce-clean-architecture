import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> addUserData({required UserEntity userEntity});
  Future<Either<Failure, UserEntity>> getUserData({required String uId});
}
