import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImplementation({required this.authService});

  @override
  Future<Either<Failure, String>> createNewAccount({
    required String email,
    required String password,
  }) async {
    try {
      final user =
          await authService.register(email: email, password: password) as User;

      return Right(user.uid);
    } on CustomException catch (e) {
      log(
        "error happend in AuthRepoImplementation in createNewAccount the error : $e",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var user = await authService.signIn(email: email, password: password);

      return Right(user.uid);
    } on CustomException catch (e) {
      log("error happend in AuthRepoImplementation in signIn the error : $e");
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authService.signOut();
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in AuthRepoImplementation in signOut the error : ${e.exceptionMeassge}",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword({
    required String newPassword,
  }) async {
    try {
      await authService.updatePassword(newPassword: newPassword);
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in AuthRepoImplementation in updatePassword the error : $e",
      );
      return Left(
        ServerFailure(message: "the error happend in updatePassword method $e"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteCurrentUser() async {
    try {
      await authService.delete();
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in AuthRepoImplementation in deleteCurrentUser the error : $e",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentUserId() async {
    try {
      var result = await authService.getCurrentUserId();
      return Right(result);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> sendResetPasswordEmail({
    required String email,
  }) async {
    try {
      await authService.resetPassword(email: email);
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
