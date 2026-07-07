import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/my_order_entity/my_order_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
  Stream<List<MyOrderEntity>> getOrders({
    required String userId,
  });
}
