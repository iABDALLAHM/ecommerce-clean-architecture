import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addCartItem({required CartItemEntity cartItem}) {
    cartItems.add(cartItem);
  }
}
