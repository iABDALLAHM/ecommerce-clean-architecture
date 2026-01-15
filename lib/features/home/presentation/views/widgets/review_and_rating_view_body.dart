import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/add_review_text_field.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/review_item.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/review_summary_section.dart';
import 'package:flutter/material.dart';

class ReviewAndRatingViewBody extends StatelessWidget {
  const ReviewAndRatingViewBody({super.key});

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
                Text("324 مراجعه", style: AppStyles.textStyle13Bold),
                const SizedBox(height: 5),
                ReviewsSummarySection(),
                ReviewItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
