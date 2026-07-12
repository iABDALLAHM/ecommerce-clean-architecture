import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/featured_product_entity/featured_product_entity.dart';

abstract class FeaturedProductsRepository {
  Future<Either<Failure, List<FeaturedProductEntity>>> getFeaturedProducts();
}
