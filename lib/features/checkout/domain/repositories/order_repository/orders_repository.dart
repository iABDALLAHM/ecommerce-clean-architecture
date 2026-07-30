import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity/shipping_address_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
  Stream<List<OrderEntity>> getOrders({required String userId});
  Future<Either<Failure, void>> saveAddress({
    required ShippingAddressEntity addressEntity,
  });
  Future<Either<Failure, void>> saveCardDetails({
    required CardEntity cardEntity,
  });
}
