import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reviewsList});
  final List<ReviewEntity> reviewsList;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomDivider(),
      ),
      itemCount: reviewsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          child: ReviewItem(reviewEntity: reviewsList[index]),
        );
      },
    );
  }
}
