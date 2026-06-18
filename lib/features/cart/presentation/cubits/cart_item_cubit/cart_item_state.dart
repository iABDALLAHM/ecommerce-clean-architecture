import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_item_entity.dart';

abstract class CartItemStates {}

final class InitialCartItemState extends CartItemStates {}

final class CartItemStateUpdated extends CartItemStates {
  final CartItemEntity cartItemEntity;

  CartItemStateUpdated({required this.cartItemEntity});
  
}
