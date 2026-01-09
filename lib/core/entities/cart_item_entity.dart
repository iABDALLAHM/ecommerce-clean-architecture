import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  final int count;

  CartItemEntity({required this.productEntity, this.count = 0});
}
