import 'dart:developer';
import 'package:ecommerce_clean_architecture/core/entities/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/shipping_address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    required this.shippingAddressEntity,
  }) {
    log("Initaliz OrderEnitiy one time");
  }
}
