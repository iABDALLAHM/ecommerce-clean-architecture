import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/models/review_model.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["productName"],
      productPrice: json["productPrice"],
      productCode: json["productCode"],
      productDiscription: json["productDiscription"],
      isFeaturedProduct: json["isFeaturedProduct"],
      isOrganicProduct: json["isOrganicProduct"],
      expirationYears: json["expirationYears"],
      numberOfCalories: json["numberOfCalories"],
      unitAmount: json["unitAmount"],
      reviews: (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
      productImageUrl: json["productImageUrl"],
      averageRating: json["averageRating"],
      ratingCount: json["ratingCount"],
      sellingCount: json["sellingCount"],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productImageUrl: productImageUrl,
      productName: productName,
      productPrice: productPrice,
      productCode: productCode,
      productDiscription: productDiscription,
      isFeaturedProduct: isFeaturedProduct,
      isOrganicProduct: isOrganicProduct,
      expirationYears: expirationYears,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((reviewModel) => reviewModel.toEntity()).toList(),
      ratingCount: ratingCount,
      averageRating: averageRating,
      sellingCount: sellingCount,
    );
  }

  factory ProductModel.fromEntity({required ProductEntity productEntity}) {
    return ProductModel(
      sellingCount: productEntity.sellingCount,
      reviews: productEntity.reviews
          .map(
            (reviewEntity) =>
                ReviewModel.fromEntity(reviewEntity: reviewEntity),
          )
          .toList(),
      isOrganicProduct: productEntity.isOrganicProduct,
      productName: productEntity.productName,
      productPrice: productEntity.productPrice,
      productCode: productEntity.productCode,
      productDiscription: productEntity.productDiscription,
      isFeaturedProduct: productEntity.isFeaturedProduct,
      productImageUrl: productEntity.productImageUrl,
      expirationYears: productEntity.expirationYears,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
      averageRating: productEntity.averageRating,
      ratingCount: productEntity.ratingCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "sellingCount": sellingCount,
      "reviews": reviews.map((reviewModel) => reviewModel.toMap()).toList(),
      "ratingCount": ratingCount,
      "averageRating": averageRating,
      "unitAmount": unitAmount,
      "numberOfCalories": numberOfCalories,
      "expirationYears": expirationYears,
      "productName": productName,
      "productPrice": productPrice,
      "productCode": productCode,
      "productDiscription": productDiscription,
      "isFeaturedProduct": isFeaturedProduct,
      "productImageUrl": productImageUrl,
      "isOrganicProduct": isOrganicProduct,
    };
  }
}
