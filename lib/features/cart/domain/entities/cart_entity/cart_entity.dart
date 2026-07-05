import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;

  const CartEntity({required this.items});

  void addCartItem({required CartItemEntity cartItem}) {
    items.add(cartItem);
  }

  void removeCartItem({required CartItemEntity cartItem}) {
    items.remove(cartItem);
  }

  bool isExist({required ProductEntity productEntity}) {
    for (var cartItem in items) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in items) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  CartItemEntity getCartItem({required ProductEntity productEntity}) {
    for (var cartItem in items) {
      if (cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }

  @override
  String toString() {
    return "$items";
  }
}
