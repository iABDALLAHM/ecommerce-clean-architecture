import 'package:ecommerce_clean_architecture/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final num price;
  final String code;
  final String discription;
  final bool isFeatured;
  final String imageUrl;
  final bool isOrganic;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating, ratingCount;
  final List<ReviewEntity> reviews;
  final int sellingCount;

  const ProductEntity({
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
  
  @override
  List<Object?> get props => [code];
}
