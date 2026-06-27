import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';

int calculatePercentage({required List<ProductReviewEntity> reviews}) {
  if (reviews.isEmpty) return 0;

  int positiveReviews = reviews
      .where((review) => review.reviewerRating >= 4.0)
      .length;

  return ((positiveReviews / reviews.length) * 100).toInt();
}
