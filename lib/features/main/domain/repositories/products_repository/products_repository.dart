import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, void>> addFavoriteProduct({
    required ProductEntity product,
  });
  Future<Either<Failure, void>> removeFavoriteProduct({
    required ProductEntity product,
  });
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts();
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required String searchName,
  });
}
