import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';

abstract class CartStates {}

final class InitialCartState extends CartStates {}

final class ProductAddedState extends CartStates {
  final CartItemEntity cartItemEntity;

  ProductAddedState({required this.cartItemEntity});
}

final class ProductRemovedState extends CartStates {}

final class LoadingAddProductState extends CartStates {
  final CartItemEntity cartItemEntity;
  LoadingAddProductState({required this.cartItemEntity});
}

final class ProductIncreaseState extends CartStates {
  final CartItemEntity cartItemEntity;

  ProductIncreaseState({required this.cartItemEntity});
}

final class ProductDecreaseState extends CartStates {
  final CartItemEntity cartItemEntity;

  ProductDecreaseState({required this.cartItemEntity});
}
