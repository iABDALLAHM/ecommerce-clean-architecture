import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

abstract class SearchStates {}

final class InitialSearchState extends SearchStates {}

final class LoadingSearchState extends SearchStates {}

final class SuccessSearchState extends SearchStates {
  final ProductEntity productEntity;
  SuccessSearchState({required this.productEntity});
}

final class FailureSearchState extends SearchStates {
  final String errMessage;
  FailureSearchState({required this.errMessage});
}
