import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';

abstract class CartStates {}

final class InitialCartState extends CartStates {}

class CartUpdatedState extends CartStates {
  final CartEntity cartEntity;
  final CartItemEntity? cartItemEntity;

  CartUpdatedState({required this.cartEntity, this.cartItemEntity});
}
