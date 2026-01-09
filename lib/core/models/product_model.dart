import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/models/review_model.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      price: json["price"],
      code: json["code"],
      discription: json["description"],
      isFeatured: json["isFeatured"],
      isOrganic: json["isOrganic"],
      expirationMonths: json["expirationMonths"],
      numberOfCalories: json["numberOfCalories"],
      unitAmount: json["unitAmount"],
      reviews: (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
      imageUrl: json["imageUrl"],
      averageRating: json["averageRating"],
      ratingCount: json["ratingCount"],
      sellingCount: json["sellingCount"],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      imageUrl: imageUrl,
      name: name,
      price: price,
      code: code,
      discription: discription,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((reviewModel) => reviewModel.toEntity()).toList(),
      ratingCount: ratingCount,
      averageRating: averageRating,
      sellingCount: sellingCount,
    );
  }
}
