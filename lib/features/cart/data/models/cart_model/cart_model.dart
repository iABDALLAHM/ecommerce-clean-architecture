import 'dart:convert';

import 'package:ecommerce_clean_architecture/features/cart/data/models/cart_item_model/cart_item_model.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';

class CartModel {
  final List<CartItemModel> items;

  const CartModel({required this.items});

  factory CartModel.fromEntity({required CartEntity cartEntity}) {
    return CartModel(
      items: cartEntity.items
          .map((ele) => CartItemModel.fromEntity(cartItemEntity: ele))
          .toList(),
    );
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json["items"] as List)
          .map((ele) => CartItemModel.fromJson(ele))
          .toList(),
    );
  }

  CartEntity toEntity() {
    return CartEntity(items: items.map((ele) => ele.toEntity()).toList());
  }

  Map<String, dynamic> toMap() {
    return {"items": items.map((ele) => ele.toMap()).toList()};
  }

  // working alone inside memory
  String toJson() => json.encode(toMap());

  factory CartModel.fromMap(String source) {
    return CartModel.fromJson(json.decode(source));
  }
}
