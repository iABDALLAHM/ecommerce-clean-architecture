import '../../../../../main/domain/entities/product_entity/product_entity.dart';

abstract class GetFavoriteProductsStates {}

final class InitialGetFavoriteProductsState extends GetFavoriteProductsStates {}

final class LoadingGetFavoriteProductsState extends GetFavoriteProductsStates {}

final class EmptyFavoriteProductsState extends GetFavoriteProductsStates {}

final class SuccessGetFavoriteProductsState extends GetFavoriteProductsStates {
  final List<ProductEntity> productsList;
  SuccessGetFavoriteProductsState({required this.productsList});
}

final class FailureGetFavoriteProductsState extends GetFavoriteProductsStates {
  final String errorMessage;
  FailureGetFavoriteProductsState({required this.errorMessage});
}
