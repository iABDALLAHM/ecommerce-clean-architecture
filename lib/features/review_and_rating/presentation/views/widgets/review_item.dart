import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_with_user/product_review_with_user_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/custom_reviewer_image.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required ProductReviewWithUserEntity productReviewWithUserEntity,
  }) : _productReviewWithUserEntity = productReviewWithUserEntity;

  final ProductReviewWithUserEntity _productReviewWithUserEntity;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _productReviewWithUserEntity.userEntity.name,
                    style: AppStyles.textStyle16SemiBold,
                  ),
                  Text(
                    "${_productReviewWithUserEntity.productReviewEntity.reviewDate.day}/${_productReviewWithUserEntity.productReviewEntity.reviewDate.month}/${_productReviewWithUserEntity.productReviewEntity.reviewDate.year}",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: colorScheme.tertiaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              CustomReviewerImage(
                reviewerRating: _productReviewWithUserEntity
                    .productReviewEntity
                    .reviewerRating,
                reviewerImageUrl:
                    _productReviewWithUserEntity.userEntity.userImage,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _productReviewWithUserEntity.productReviewEntity.reviewerMessage,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textStyle13Regular.copyWith(
              color: colorScheme.tertiaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
