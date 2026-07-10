import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/card_entity/card_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, void>> addNewCard({required CardEntity card});
  Future<Either<Failure, List<CardEntity>>> getMyCards({required String uId});
}
