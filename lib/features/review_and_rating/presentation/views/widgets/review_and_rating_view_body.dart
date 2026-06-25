import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/add_review_text_field.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/review_summary_section.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/reviews_list_view.dart';
import 'package:flutter/material.dart';

class ReviewAndRatingViewBody extends StatelessWidget {
  const ReviewAndRatingViewBody({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                AddReviewTextField(),
                const SizedBox(height: 16),
                Text(
                  "${productEntity.ratingCount} مراجعه",
                  style: AppStyles.textStyle13Bold,
                ),
                const SizedBox(height: 5),
                ReviewsSummarySection(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        productEntity.reviews.length > 0
            ? SliverToBoxAdapter(child: CustomDivider())
            : SliverToBoxAdapter(child: SizedBox()),
        ReviewsListView(reviewsList: productEntity.reviews),

        SliverToBoxAdapter(child: SizedBox(height: 10)),
      ],
    );
  }
}
