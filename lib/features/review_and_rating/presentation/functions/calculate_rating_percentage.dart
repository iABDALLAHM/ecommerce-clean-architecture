import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_with_user/product_review_with_user_entity.dart';

Map<int, double> calculateRatingPercentages({
  required List<ProductReviewWithUserEntity> reviews,
}) {
  if (reviews.isEmpty) {
    return {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
  }

  final Map<int, int> countMap = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};

  for (var review in reviews) {
    int rating = review.productReviewEntity.reviewerRating.round();
    if (rating >= 1 && rating <= 5) {
      countMap[rating] = countMap[rating]! + 1;
    }
  }

  final total = reviews.length;

  return countMap.map(
    (key, value) => MapEntry(key, total > 0 ? (value / total) : 0),
  );
}
