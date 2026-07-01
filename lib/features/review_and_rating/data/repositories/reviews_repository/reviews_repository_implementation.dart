import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/data/models/review_model/product_review_model.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';

class ReviewsRepositoryImplementation implements ReviewsRepository {
  final DatabaseService _databaseService;
  ReviewsRepositoryImplementation({required DatabaseService databaseService})
    : _databaseService = databaseService;

  @override
  Future<Either<Failure, void>> addReview({
    required ProductReviewEntity productReviewEntity,
  }) async {
    try {
      await _databaseService.addSubCollectionData(
        documentId: productReviewEntity.productCode,
        path: BackendEndPoints.getProducts,
        subCollection: BackendEndPoints.addReviews,
        data: ProductReviewModel.fromEntity(
          productReviewEntity: productReviewEntity,
        ).toMap(),
      );
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<ProductReviewEntity>>> getAllReviews({
    required String productCode,
  }) async {
    try {
      var result = await _databaseService.getNestedData(
        path: BackendEndPoints.getProducts,
        documentId: productCode,
        subCollection: BackendEndPoints.addReviews,
      );

      List<ProductReviewEntity> productsList = [];

      for (var product in result) {
        productsList.add(ProductReviewModel.fromJson(product).toEntity());
      }

      return Right(productsList);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
