import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWith;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity({
    required this.cartEntity,
    this.payWith,
    required this.shippingAddressEntity,
    required this.uId,
  });

  @override
  String toString() {
    return "$uId $cartEntity $payWith ${shippingAddressEntity.name}";
  }
}
