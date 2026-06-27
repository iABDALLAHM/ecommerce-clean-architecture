import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';

class ProductReviewModel {
  final String productCode;
  final DateTime reviewDate;
  final String reviewerName;
  final String reviewerImage;
  final String reviewerMessage;
  final double reviewerRating;

  ProductReviewModel({
    required this.productCode,
    required this.reviewDate,
    required this.reviewerName,
    required this.reviewerImage,
    required this.reviewerMessage,
    required this.reviewerRating,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      productCode: json["productCode"],
      reviewDate: (json["reviewDate"] as Timestamp).toDate(),
      reviewerName: json["reviewerName"],
      reviewerImage: json["reviewerImage"],
      reviewerMessage: json["reviewerMessage"],
      reviewerRating: json["reviewerRating"],
    );
  }

  factory ProductReviewModel.fromEntity({
    required ProductReviewEntity productReviewEntity,
  }) {
    return ProductReviewModel(
      productCode: productReviewEntity.productCode,
      reviewDate: productReviewEntity.reviewDate,
      reviewerName: productReviewEntity.reviewerName,
      reviewerImage: productReviewEntity.reviewerImage,
      reviewerMessage: productReviewEntity.reviewerMessage,
      reviewerRating: productReviewEntity.reviewerRating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "productCode": productCode,
      "reviewDate": reviewDate,
      "reviewerName": reviewerName,
      "reviewerImage": reviewerImage,
      "reviewerMessage": reviewerMessage,
      "reviewerRating": reviewerRating,
    };
  }

  ProductReviewEntity toEntity() {
    return ProductReviewEntity(
      productCode: productCode,
      reviewDate: reviewDate,
      reviewerName: reviewerName,
      reviewerImage: reviewerImage,
      reviewerMessage: reviewerMessage,
      reviewerRating: reviewerRating,
    );
  }
}
