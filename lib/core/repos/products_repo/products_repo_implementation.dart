import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/models/product_model.dart';
import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';

class ProductsRepoImplementation implements ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImplementation({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndPoints.getProducts,
      );
      List<ProductEntity> productsList = [];
      for (var productEntity in data) {
        productsList.add(ProductModel.fromJson(productEntity).toEntity());
      }
      return Right(productsList);
    } catch (e) {
      return Left(ServerFailure(message: "فشل إرجاع البيانات"));
    }
  }

  @override
  Future<Either<Failure, void>> addFavoriteProducts({
    required ProductEntity product,
  }) async {
    try {
      await databaseService.addData(
        path: BackendEndPoints.addUserData,
        secondPath: BackendEndPoints.addFavoriteProducts,
        data: ProductModel.fromEntity(productEntity: product).toMap(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "فشل إضافة المنتج"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts() {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }
}
