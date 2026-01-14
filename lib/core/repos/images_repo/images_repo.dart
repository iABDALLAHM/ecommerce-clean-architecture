import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage({required File file});
}
