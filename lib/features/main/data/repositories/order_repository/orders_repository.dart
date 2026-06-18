import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
}
