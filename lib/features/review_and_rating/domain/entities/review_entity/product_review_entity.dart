class ProductReviewEntity {
  final String productCode;
  final DateTime reviewDate;
  final String reviewerName;
  final String reviewerImage;
  final String reviewerMessage;
  final double reviewerRating;

  ProductReviewEntity({
    required this.productCode,
    required this.reviewDate,
    required this.reviewerName,
    required this.reviewerImage,
    required this.reviewerMessage,
    required this.reviewerRating,
  });
}
