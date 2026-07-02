class ProductReviewEntity {
  final String productCode;
  final DateTime reviewDate;
  final String reviewerUid;
  final String reviewerMessage;
  final double reviewerRating;

  ProductReviewEntity({
    required this.productCode,
    required this.reviewDate,
    required this.reviewerMessage,
    required this.reviewerRating,
    required this.reviewerUid,
  });
}
