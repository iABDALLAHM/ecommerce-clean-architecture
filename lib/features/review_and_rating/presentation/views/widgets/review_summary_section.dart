import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_state.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/functions/calculate_average_rating.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/functions/calculate_percentage.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/reviews_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsSummarySection extends StatelessWidget {
  const ReviewsSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("الملخص", style: AppStyles.textStyle16SemiBold),
        const SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            children: [
              BlocBuilder<GetReviewsCubit, GetReviewsState>(
                builder: (context, state) {
                  if (state is SuccessGetReviewsState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 8),
                            Text(
                              "${calculateAverageRating(reviews: state.productReviewsList)}",
                              style: AppStyles.textStyle13Bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        Text(
                          "${calculatePercentage(reviews: state.productReviewsList)}%",
                          style: AppStyles.textStyle16Regular,
                        ),
                        const SizedBox(height: 22),
                        Text("موصي بها", style: AppStyles.textStyle13Regular),
                      ],
                    );
                  } else if (state is EmptyGetReviewsState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 8),
                            Text("0", style: AppStyles.textStyle13Bold),
                          ],
                        ),
                        const SizedBox(height: 22),
                        Text("0%", style: AppStyles.textStyle16Regular),
                        const SizedBox(height: 22),
                        Text("", style: AppStyles.textStyle13Regular),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              const SizedBox(width: 22),
              Expanded(child: ReviewsIndicator()),
            ],
          ),
        ),
      ],
    );
  }
}
