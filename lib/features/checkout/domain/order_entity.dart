import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/shipping_address_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddressEntity;

  OrderEntity({
    required this.cartItems,
    required this.payWithCash,
    required this.shippingAddressEntity,
  });
}
