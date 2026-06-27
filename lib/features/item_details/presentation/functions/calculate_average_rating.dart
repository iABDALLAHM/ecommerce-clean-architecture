import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';

double calculateAverageRating({required List<ProductReviewEntity> reviews}) {
  if (reviews.isEmpty) return 0.0;

  double totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.reviewerRating;
  }
  double average = totalRating / reviews.length;
  return (average > 5.0 ? 5.0 : average).floor().toDouble();
}
