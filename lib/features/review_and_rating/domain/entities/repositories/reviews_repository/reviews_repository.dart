import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';

abstract class ReviewsRepository {
  Future<Either<Failure, void>> addReview({
    required ProductReviewEntity productReviewEntity,
  });

  Future<Either<Failure, List<ProductReviewEntity>>> getAllReviews({
    required String productCode,
  });
}
