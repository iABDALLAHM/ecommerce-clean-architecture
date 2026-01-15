import 'package:ecommerce_clean_architecture/core/entities/review_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_image_review_item.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.reviewEntity});
  final ReviewEntity reviewEntity;
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
                  Text(reviewEntity.name, style: AppStyles.textStyle16SemiBold),
                  Text(
                    reviewEntity.date.split(" ")[0],
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff949D9E),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              CustomImageReviewItem(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            reviewEntity.reviewDescription,
            style: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ],
      ),
    );
  }
}
