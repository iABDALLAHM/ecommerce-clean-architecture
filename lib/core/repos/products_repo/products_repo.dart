import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, void>> addFavoriteProducts({
    required ProductEntity product,
  });
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts();
}
