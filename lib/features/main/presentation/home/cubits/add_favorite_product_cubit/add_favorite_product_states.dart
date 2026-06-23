import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';

abstract class FavoriteProductStates {}

class InitialFavoriteProductState extends FavoriteProductStates {}

class SuccessAddFavoriteProduct extends FavoriteProductStates {
  final ProductEntity productEntity;

  SuccessAddFavoriteProduct({required this.productEntity});

}

class SuccessRemoveFavoriteProduct extends FavoriteProductStates {
  final ProductEntity productEntity;

  SuccessRemoveFavoriteProduct({required this.productEntity});
}

class FailureAddFavoriteProduct extends FavoriteProductStates {
  final String errorMessage;

  FailureAddFavoriteProduct({required this.errorMessage});
}

class FailureRemoveFavoriteProduct extends FavoriteProductStates {
  final String errorMessage;

  FailureRemoveFavoriteProduct({required this.errorMessage});
}
