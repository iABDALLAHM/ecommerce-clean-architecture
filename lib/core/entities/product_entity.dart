import 'package:ecommerce_clean_architecture/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final num price;
  final String code;
  final String discription;
  final bool isFeatured;
  final String? imageUrl;
  final bool isOrganic;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating, ratingCount;
  final List<ReviewEntity> reviews;
  final int sellingCount;

  ProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.discription,
    required this.isFeatured,
    required this.imageUrl,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.averageRating,
    required this.ratingCount,
    required this.reviews,
    required this.sellingCount,
  });
}
