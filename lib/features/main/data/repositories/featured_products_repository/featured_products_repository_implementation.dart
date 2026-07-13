import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/main/data/models/featured_product_model/featured_product_model.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/featured_product_entity/featured_product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/featured_products_repository/featured_products_repository.dart';

class FeaturedProductsRepositoryImplementation
    implements FeaturedProductsRepository {
  FeaturedProductsRepositoryImplementation({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<Either<Failure, List<FeaturedProductEntity>>>
  getFeaturedProducts() async {
    try {
      var result = await _databaseService.getData(
        path: BackendEndPoints.featuredProductsCollection,
      );
      List<FeaturedProductEntity> productsList = [];
      for (var product in result) {
        productsList.add(
          FeaturedProductModel.fromJson(json: product).toEntity(),
        );
      }

      return Right(productsList);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
