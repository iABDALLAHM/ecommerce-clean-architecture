import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/storage_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';

class ImagesRepoImplementation implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImplementation({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage({required File file}) async {
    try {
      String imageUrl = await storageService.uploadFile(
        file: file,
        path: BackendEndPoints.usersImages,
      );
      return Right(imageUrl);
    } on CustomException catch (e) {
      log("error happend in ImagesRepoImplementation in uploadImage $e");
      return Left(
        ServerFailure(message: e.exceptionMeassge),
      );
    }
  }
}
