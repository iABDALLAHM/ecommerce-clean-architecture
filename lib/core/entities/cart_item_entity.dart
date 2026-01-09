import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});
// اي حاجة هنا خاصة بال cartItemEntity
  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  int increaseCount() {
    return count++;
  }

  int decreaseCount() {
    return count--;
  }
}
