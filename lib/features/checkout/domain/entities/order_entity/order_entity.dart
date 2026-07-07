import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_status_entity/order_status_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final CartEntity cartEntity;
  ShippingAddressEntity shippingAddressEntity;
  bool? payWithCash;
  final DateTime date;
  final String orderNumber;
  final OrderStatusEntity orderStatusEntity;

  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    required this.shippingAddressEntity,
    required this.uId,
    required this.date,
    required this.orderNumber,
    required this.orderStatusEntity,
    required this.totalPrice,
  });

  @override
  String toString() {
    return "$cartEntity $payWithCash $shippingAddressEntity";
  }
}
