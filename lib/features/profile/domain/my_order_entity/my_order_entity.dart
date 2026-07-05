import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_status_entity/order_status_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/product_item_entity/product_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity/shipping_address_entity.dart';

class MyOrderEntity {
  final double totalPrice;
  final List<ProductItemEntity> products;
  final String uId;
  final ShippingAddressEntity shippingAddressEntity;
  final bool payWithCash;
  final DateTime date;
  final String orderNumber;
  final OrderStatusEntity orderStatusEntity;

  MyOrderEntity({
    required this.shippingAddressEntity,
    required this.totalPrice,
    required this.uId,
    required this.date,
    required this.orderNumber,
    required this.payWithCash,
    required this.orderStatusEntity,
    required this.products,
  });
}
