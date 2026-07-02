import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> createNewAccount({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> deleteCurrentUser();

  Future<Either<Failure, void>> updatePassword({required String newPassword});

  Future<Either<Failure, String>> getCurrentUserId();
}
