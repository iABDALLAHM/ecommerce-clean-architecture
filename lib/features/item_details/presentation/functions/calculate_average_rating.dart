import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_with_user/product_review_with_user_entity.dart';

double calculateAverageRating({
  required List<ProductReviewWithUserEntity> reviews,
}) {
  if (reviews.isEmpty) return 0.0;

  double totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.productReviewEntity.reviewerRating;
  }
  double average = totalRating / reviews.length;
  return (average > 5.0 ? 5.0 : average).floor().toDouble();
}
