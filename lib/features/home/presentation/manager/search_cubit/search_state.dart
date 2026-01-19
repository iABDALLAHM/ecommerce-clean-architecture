import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

abstract class SearchStates {}

final class InitialSearchState extends SearchStates {}

final class LoadingSearchState extends SearchStates {}

final class EmptySearchState extends SearchStates {}

final class SuccessSearchState extends SearchStates {
  final List<ProductEntity> productsList;
  SuccessSearchState({required this.productsList});
}

final class FailureSearchState extends SearchStates {
  final String errMessage;
  FailureSearchState({required this.errMessage});
}
