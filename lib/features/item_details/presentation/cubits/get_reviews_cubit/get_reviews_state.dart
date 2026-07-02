import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_with_user/product_review_with_user_entity.dart';

abstract class GetReviewsState {}

final class InitialGetReviewsState extends GetReviewsState {}

final class SuccessGetReviewsState extends GetReviewsState {
  final List<ProductReviewWithUserEntity> productReviewWithUserEntity;

  SuccessGetReviewsState({required this.productReviewWithUserEntity});
}

final class EmptyGetReviewsState extends GetReviewsState {}

final class FailureGetReviewsState extends GetReviewsState {
  final String errorMessage;

  FailureGetReviewsState({required this.errorMessage});
}

final class LoadingGetReviewsState extends GetReviewsState {}
