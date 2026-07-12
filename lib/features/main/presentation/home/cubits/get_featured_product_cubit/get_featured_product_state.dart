import 'package:ecommerce_clean_architecture/features/main/domain/entities/featured_product_entity/featured_product_entity.dart';

abstract class GetFeaturedProductState {}

final class InitialGetFeaturedProductState extends GetFeaturedProductState {}

final class SuccessGetFeaturedProductState extends GetFeaturedProductState {
  final List<FeaturedProductEntity> featuredProducts;

  SuccessGetFeaturedProductState({required this.featuredProducts});
}

final class FailureGetFeaturedProductState extends GetFeaturedProductState {
  final String errorMessage;

  FailureGetFeaturedProductState({required this.errorMessage});
}

final class LoadingGetFeaturedProductState extends GetFeaturedProductState {}
