import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';

abstract class ProductsStates {}

final class InitialProductsState extends ProductsStates {}

final class LoadingProductsState extends ProductsStates {}

final class SuccessProductsState extends ProductsStates {
  final List<ProductEntity> products;
  SuccessProductsState({required this.products});
}

final class FailureProductsState extends ProductsStates {
  final String errorMessage;
  FailureProductsState({required this.errorMessage});
}
