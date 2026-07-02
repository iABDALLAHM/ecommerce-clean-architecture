import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_entity/product_review_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_with_user/product_review_with_user_entity.dart';

abstract class ReviewsRepository {
  Future<Either<Failure, void>> addReview({
    required ProductReviewEntity productReviewEntity,
  });

  Future<Either<Failure, List<ProductReviewWithUserEntity>>>
  getAllReviewsForSpecificProduct({required String productCode});
}
