import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      name: cartItemEntity.productEntity.productName,
      code: cartItemEntity.productEntity.productCode,
      imageUrl: cartItemEntity.productEntity.productImageUrl,
      price: cartItemEntity.productEntity.productPrice,
      quantity: cartItemEntity.productEntity.unitAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "code": code,
      "imageUrl": imageUrl,
      "price": price,
      "quantity": quantity,
    };
  }
}
