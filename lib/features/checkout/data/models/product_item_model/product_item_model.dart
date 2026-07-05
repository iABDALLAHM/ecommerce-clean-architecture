import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/product_item_entity/product_item_entity.dart';

class ProductItemModel {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final int quantity;

  ProductItemModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory ProductItemModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return ProductItemModel(
      name: cartItemEntity.productEntity.productName,
      code: cartItemEntity.productEntity.productCode,
      imageUrl: cartItemEntity.productEntity.productImageUrl,
      price: cartItemEntity.productEntity.productPrice,
      quantity: cartItemEntity.productEntity.unitAmount,
    );
  }

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      name: json["name"],
      code: json["code"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      quantity: json["quantity"],
    );
  }
  ProductItemEntity toEntity() {
    return ProductItemEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
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
