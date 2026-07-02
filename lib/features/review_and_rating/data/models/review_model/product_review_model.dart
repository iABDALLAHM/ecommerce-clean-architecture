import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_entity/product_review_entity.dart';

class ProductReviewModel {
  final String productCode;
  final String reviewerUid;
  final DateTime reviewDate;
  final String reviewerMessage;
  final double reviewerRating;

  ProductReviewModel({
    required this.productCode,
    required this.reviewDate,
    required this.reviewerMessage,
    required this.reviewerRating,
    required this.reviewerUid,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      productCode: json["productCode"],
      reviewDate: (json["reviewDate"] as Timestamp).toDate(),
      reviewerMessage: json["reviewerMessage"],
      reviewerRating: json["reviewerRating"],
      reviewerUid: json["reviewerUid"],
    );
  }

  factory ProductReviewModel.fromEntity({
    required ProductReviewEntity productReviewEntity,
  }) {
    return ProductReviewModel(
      productCode: productReviewEntity.productCode,
      reviewDate: productReviewEntity.reviewDate,
      reviewerMessage: productReviewEntity.reviewerMessage,
      reviewerRating: productReviewEntity.reviewerRating,
      reviewerUid: productReviewEntity.reviewerUid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "productCode": productCode,
      "reviewDate": reviewDate,
      "reviewerMessage": reviewerMessage,
      "reviewerRating": reviewerRating,
      "reviewerUid": reviewerUid,
    };
  }

  ProductReviewEntity toEntity() {
    return ProductReviewEntity(
      productCode: productCode,
      reviewDate: reviewDate,
      reviewerMessage: reviewerMessage,
      reviewerRating: reviewerRating,
      reviewerUid: reviewerUid,
    );
  }
}
