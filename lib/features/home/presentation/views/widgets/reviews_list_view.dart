import 'package:ecommerce_clean_architecture/core/entities/review_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reviewsList});
  final List<ReviewEntity> reviewsList;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
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
