import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});

  void addCartItem({required CartItemEntity cartItem}) {
    cartItems.add(cartItem);
  }

  void removeCartItem({required CartItemEntity cartItem}) {
    cartItems.remove(cartItem);
  }

  bool isExist({required ProductEntity productEntity}) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  CartItemEntity getCartItem({required ProductEntity productEntity}) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }
}
