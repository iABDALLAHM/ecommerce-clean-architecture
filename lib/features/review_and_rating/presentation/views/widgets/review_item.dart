import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/custom_reviewer_image.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required ProductReviewEntity productReviewEntity,
  }) : _productReviewEntity = productReviewEntity;

  final ProductReviewEntity _productReviewEntity;

  @override
  Widget build(BuildContext context) {
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
                    _productReviewEntity.reviewerName,
                    style: AppStyles.textStyle16SemiBold,
                  ),
                  Text(
                    "${_productReviewEntity.reviewDate.day}/${_productReviewEntity.reviewDate.month}/${_productReviewEntity.reviewDate.year}",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff949D9E),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              CustomReviewerImage(
                reviewerRating: _productReviewEntity.reviewerRating,
                reviewerImageUrl: _productReviewEntity.reviewerImage,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _productReviewEntity.reviewerMessage,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ],
      ),
    );
  }
}
