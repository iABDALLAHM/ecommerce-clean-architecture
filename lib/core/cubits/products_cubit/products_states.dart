import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

abstract class GetProductsStates {}

final class InitialGetProductsState extends GetProductsStates {}

final class LoadingGetProductsState extends GetProductsStates {}
final class SuccessGetProductsState extends GetProductsStates {
  final List<ProductEntity> products;

  SuccessGetProductsState({required this.products});
  
}
final class FailureGetProductsState extends GetProductsStates {}

