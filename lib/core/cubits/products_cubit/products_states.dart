import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

abstract class ProductsStates {}

final class InitialProductsState extends ProductsStates {}

final class LoadingProductsState extends ProductsStates {}
final class SuccessProductsState extends ProductsStates {
  final List<ProductEntity> products;

  SuccessProductsState({required this.products});
  
}
final class FailureProductsState extends ProductsStates {}

