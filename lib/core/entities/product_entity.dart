import 'package:ecommerce_clean_architecture/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDiscription;
  final bool isFeaturedProduct;
  final String productImageUrl;
  final bool isOrganicProduct;
  final int expirationYears;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating, ratingCount;
  final List<ReviewEntity> reviews;
  final int sellingCount;

  const ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDiscription,
    required this.isFeaturedProduct,
    required this.productImageUrl,
    required this.isOrganicProduct,
    required this.expirationYears,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.averageRating,
    required this.ratingCount,
    required this.reviews,
    required this.sellingCount,
  });
  
  @override
  List<Object?> get props => [productCode];
}
