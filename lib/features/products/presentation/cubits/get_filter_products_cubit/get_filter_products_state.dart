import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';

abstract class GetFilterProductsState {}

final class SuccessGetFilterProductsState extends GetFilterProductsState {
  final List<ProductEntity> filterProducts;

  SuccessGetFilterProductsState({required this.filterProducts});
}

final class LoadingGetFilterProductsState extends GetFilterProductsState {}

final class FailureGetFilterProductsState extends GetFilterProductsState {
  final String errorMessage;

  FailureGetFilterProductsState({required this.errorMessage});
}

final class EmptyProductsState extends GetFilterProductsState {}

final class InitialGetFilterProductsState extends GetFilterProductsState {}
