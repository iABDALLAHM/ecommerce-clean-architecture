import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/models/product_model.dart';
import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
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
      await databaseService.addNestedData(
        path: BackendEndPoints.addUserData,
        subCollection: BackendEndPoints.addFavoriteProducts,
        data: ProductModel.fromEntity(productEntity: product).toMap(),
        documentId: getUserData().uId,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "فشل إضافة المنتج"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts() async {
    try {
      var result = await databaseService.getNestedData(
        path: BackendEndPoints.addUserData,
        subCollection: BackendEndPoints.getFavoriteProducts,
        documentId: getUserData().uId,
      );
      List<ProductEntity> favProducts = (result as List)
          .map((ele) => ProductModel.fromJson(ele).toEntity())
          .toList();
      return Right(favProducts);
    } catch (e) {
      return Left(ServerFailure(message: "fetch products failed"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required String searchName,
  }) async {
    try {
      var data = await databaseService.getQueryData(
        path: BackendEndPoints.getProducts,
        query: QueryParams(
          conditions: [
            QueryCondition(field: "productName", isEqualTo: searchName),
          ],
          orders: [],
        ),
      );
      List<ProductEntity> productsList = [];
      for (var productModel in data) {
        productsList.add(ProductModel.fromJson(productModel).toEntity());
      }
      return Right(productsList);
    } catch (e) {
      log("error in ProductsRepoImplementation in searchProducts $e");
      return Left(ServerFailure(message: "فشل إرجاع البيانات"));
    }
  }
}
