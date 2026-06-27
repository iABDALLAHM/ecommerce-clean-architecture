import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';

abstract class GetReviewsState {}

final class InitialGetReviewsState extends GetReviewsState {}

final class SuccessGetReviewsState extends GetReviewsState {
  final List<ProductReviewEntity> productReviewsList;

  SuccessGetReviewsState({required this.productReviewsList});
}

final class EmptyGetReviewsState extends GetReviewsState {}

final class FailureGetReviewsState extends GetReviewsState {
  final String errorMessage;

  FailureGetReviewsState({required this.errorMessage});
}

final class LoadingGetReviewsState extends GetReviewsState {}
