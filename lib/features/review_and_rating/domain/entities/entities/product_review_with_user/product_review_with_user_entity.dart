import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_entity/product_review_entity.dart';

class ProductReviewWithUserEntity {
  final ProductReviewEntity productReviewEntity;
  final UserEntity userEntity;

  ProductReviewWithUserEntity({
    required this.productReviewEntity,
    required this.userEntity,
  });
}
