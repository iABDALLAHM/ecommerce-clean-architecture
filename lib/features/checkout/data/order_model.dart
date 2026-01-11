import 'package:ecommerce_clean_architecture/features/checkout/data/order_product_model.dart';
import 'package:ecommerce_clean_architecture/features/checkout/data/shipping_address_model.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity({required OrderEntity orderEntity}) {
    return OrderModel(
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uId: orderEntity.uId,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        shippingAddressEntity: orderEntity.shippingAddressEntity,
      ),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((order) => OrderProductModel.fromEntity(cartItemEntity: order))
          .toList(),
      paymentMethod: orderEntity.payWithCash.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "totalPrice": totalPrice,
      "uId": uId,
      "shippingAddressModel": shippingAddressModel.toMap(),
      "orderProducts": orderProducts.map((order) => order.toMap()).toList(),
      "paymentMethod": paymentMethod,
    };
  }
}
