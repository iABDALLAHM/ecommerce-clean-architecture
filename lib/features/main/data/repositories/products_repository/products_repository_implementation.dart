import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/features/main/data/models/product_model/product_model.dart';
import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImplementation implements ProductsRepository {
  final DatabaseService databaseService;
  final SecureStorageRepository _secureStorageRepository;

  ProductsRepositoryImplementation({
    required this.databaseService,
    required SecureStorageRepository secureStorageRepository,
  }) : _secureStorageRepository = secureStorageRepository;

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndPoints.productsCollection,
      );
      List<ProductEntity> productsList = [];
      for (var productEntity in data) {
        productsList.add(ProductModel.fromJson(productEntity).toEntity());
      }
      return Right(productsList);
    } on CustomException catch (e) {
      log(
        "this error happend in ProductsRepoImplementation in getProducts method ${e.toString()}",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> addFavoriteProduct({
    required ProductEntity product,
  }) async {
    try {
      var result = await _secureStorageRepository.getData(key: keyUserId);

      await databaseService.addNestedData(
        path: BackendEndPoints.usersCollection,
        subCollection: BackendEndPoints.favoriteProductsCollection,
        data: ProductModel.fromEntity(productEntity: product).toMap(),
        documentId: result,
      );
      return Right(null);
    } on CustomException catch (e) {
      log(
        "this error happend in ProductsRepoImplementation in addFavoriteProducts method ${e.toString()}",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts() async {
    try {
      var userId = await _secureStorageRepository.getData(key: keyUserId);

      var result = await databaseService.getNestedData(
        path: BackendEndPoints.usersCollection,
        subCollection: BackendEndPoints.favoriteProductsCollection,
        documentId: userId,
      );
      List<ProductEntity> favProducts = (result as List)
          .map((ele) => ProductModel.fromJson(ele).toEntity())
          .toList();
      return Right(favProducts);
    } on CustomException catch (e) {
      log(
        "this error happend in ProductsRepoImplementation in getFavoriteProducts method ${e.toString()}",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required String searchName,
  }) async {
    try {
      var data = await databaseService.getQueryData(
        path: BackendEndPoints.productsCollection,
        query: QueryParams(
          condition: QueryCondition(
            field: "productName",
            isEqualTo: searchName,
          ),
        ),
      );

      List<ProductEntity> productsList = [];
      for (var productModel in data) {
        productsList.add(ProductModel.fromJson(productModel).toEntity());
      }

      return Right(productsList);
    } on CustomException catch (e) {
      log(
        "this error happend in ProductsRepoImplementation in searchProducts method ${e.toString()}",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoriteProduct({
    required ProductEntity product,
  }) async {
    try {
      var userId = await _secureStorageRepository.getData(key: keyUserId);

      await databaseService.removeNestedData(
        path: BackendEndPoints.usersCollection,
        subCollection: BackendEndPoints.favoriteProductsCollection,
        data: ProductModel.fromEntity(productEntity: product).toMap(),
        documentId: userId,
      );
      return Right(null);
    } on CustomException catch (e) {
      log(
        "this error happend in ProductsRepoImplementation in removeFavoriteProduct method ${e.toString()}",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getHighPriceProducts() async {
    try {
      var result = await databaseService.getQueryData(
        path: BackendEndPoints.productsCollection,
        query: QueryParams(
          order: QueryOrder(field: "productPrice", descending: true),
        ),
      );
      List<ProductEntity> highProductsPrice = [];
      for (var product in result) {
        highProductsPrice.add(ProductModel.fromJson(product).toEntity());
      }
      return Right(highProductsPrice);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getLowPriceProducts() async {
    try {
      var result = await databaseService.getQueryData(
        path: BackendEndPoints.productsCollection,
        query: QueryParams(order: QueryOrder(field: "productPrice")),
      );
      List<ProductEntity> lowProductsPrice = [];
      for (var product in result) {
        lowProductsPrice.add(ProductModel.fromJson(product).toEntity());
      }
      return Right(lowProductsPrice);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSortedProductsByName() async {
    try {
      var result = await databaseService.getQueryData(
        path: BackendEndPoints.productsCollection,
        query: QueryParams(order: QueryOrder(field: "productName")),
      );
      List<ProductEntity> sortedByNameProducts = [];
      for (var product in result) {
        sortedByNameProducts.add(ProductModel.fromJson(product).toEntity());
      }
      return Right(sortedByNameProducts);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
