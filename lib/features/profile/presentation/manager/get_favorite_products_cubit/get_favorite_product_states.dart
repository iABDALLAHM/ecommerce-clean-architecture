import 'package:ecommerce_clean_architecture/features/home/domain/entities/product_entity.dart';

abstract class GetFavoriteProductStates {}

final class InitialGetFavoriteProductState extends GetFavoriteProductStates {}

final class LoadingGetFavoriteProductState extends GetFavoriteProductStates {}

final class EmptyFavoriteProductState extends GetFavoriteProductStates {}

final class SuccessGetFavoriteProductState extends GetFavoriteProductStates {
  final List<ProductEntity> productsList;
  SuccessGetFavoriteProductState({required this.productsList});
}

final class FailureGetFavoriteProductState extends GetFavoriteProductStates {
  final String errMessage;
  FailureGetFavoriteProductState({required this.errMessage});
}
