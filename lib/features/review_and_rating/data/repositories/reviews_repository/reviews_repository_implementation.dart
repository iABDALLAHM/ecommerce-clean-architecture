import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/data/models/review_model/product_review_model.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_with_user/product_review_with_user_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_entity/product_review_entity.dart';

class ReviewsRepositoryImplementation implements ReviewsRepository {
  final DatabaseService _databaseService;

  ReviewsRepositoryImplementation({required DatabaseService databaseService})
    : _databaseService = databaseService;

  @override
  Future<Either<Failure, void>> addReview({
    required ProductReviewEntity productReviewEntity,
  }) async {
    try {
      await _databaseService.addData(
        path: BackendEndPoints.reviewsCollection,
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
  Future<Either<Failure, List<ProductReviewWithUserEntity>>>
  getAllReviewsForSpecificProduct({required String productCode}) async {
    try {
      var result = await _databaseService.getQueryData(
        path: BackendEndPoints.reviewsCollection,
        query: QueryParams(
          condition: QueryCondition(
            field: "productCode",
            isEqualTo: productCode,
          ),
        ),
      );

      List<ProductReviewWithUserEntity> productsWithUsersList = [];

      for (var productReview in result) {
        ProductReviewEntity productReviewEntity = ProductReviewModel.fromJson(
          productReview,
        ).toEntity();

        var userModel = await _databaseService.getSingleData(
          path: BackendEndPoints.usersCollection,
          documentId: productReviewEntity.reviewerUid,
        );

        UserEntity user = UserModel.fromJson(userModel).toEntity();

        productsWithUsersList.add(
          ProductReviewWithUserEntity(
            productReviewEntity: productReviewEntity,
            userEntity: user,
          ),
        );
      }

      return Right(productsWithUsersList);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
