import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';

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

  Future<Either<Failure, void>> updatePassword({
    required String newPassword,
    required String oldPassword,
  });

  Future<Either<Failure, void>> updateEmail({
    required String password,
    required String email,
  });

  Future<Either<Failure, String?>> getCurrentUserId();

  Future<Either<Failure, void>> sendResetPasswordEmail({required String email});

  Future<Either<Failure, void>> confirmationPassword({
    required String newPassword,
    required String code,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, void>> confirmChangeEmail({required String code});
}
