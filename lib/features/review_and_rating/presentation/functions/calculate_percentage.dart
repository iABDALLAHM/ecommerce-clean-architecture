import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_with_user/product_review_with_user_entity.dart';

int calculatePercentage({required List<ProductReviewWithUserEntity> reviews}) {
  if (reviews.isEmpty) return 0;

  int positiveReviews = reviews
      .where((review) => review.productReviewEntity.reviewerRating >= 4.0)
      .length;

  return ((positiveReviews / reviews.length) * 100).toInt();
}
