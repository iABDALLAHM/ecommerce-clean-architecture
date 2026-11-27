import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failure.dart';

abstract class ImagesRepository {
  Future<Either<Failure, String>> uploadImage({required File file});
}
