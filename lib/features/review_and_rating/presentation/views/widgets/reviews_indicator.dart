import 'dart:developer';

import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_state.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/functions/calculate_rating_percentage.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/review_line_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsIndicator extends StatelessWidget {
  const ReviewsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewsCubit, GetReviewsState>(
      builder: (context, state) {
        if (state is SuccessGetReviewsState) {

          final Map<int, double> percentages = calculateRatingPercentages(
            reviews:state.productReviewWithUserEntity,
          );

          log(percentages.toString());
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ReviewLineIndicator(percentage: percentages[5]!),
                  ),
                  const SizedBox(width: 7),
                  Text("5"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: ReviewLineIndicator(percentage: percentages[4]!),
                  ),
                  const SizedBox(width: 7),
                  Text("4"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: ReviewLineIndicator(percentage: percentages[3]!),
                  ),
                  const SizedBox(width: 7),
                  Text("3"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: ReviewLineIndicator(percentage: percentages[2]!),
                  ),
                  const SizedBox(width: 7),
                  Text("2"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: ReviewLineIndicator(percentage: percentages[1]!),
                  ),
                  const SizedBox(width: 7),
                  Text("1"),
                ],
              ),
            ],
          );
        } else if (state is LoadingGetReviewsState) {
          return CustomCircularProgressWidget();
        } else if (state is EmptyGetReviewsState) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: ReviewLineIndicator(percentage: 0)),
                  const SizedBox(width: 7),
                  Text("5"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(child: ReviewLineIndicator(percentage: 0)),
                  const SizedBox(width: 7),
                  Text("4"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(child: ReviewLineIndicator(percentage: 0)),
                  const SizedBox(width: 7),
                  Text("3"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(child: ReviewLineIndicator(percentage: 0)),
                  const SizedBox(width: 7),
                  Text("2"),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(child: ReviewLineIndicator(percentage: 0)),
                  const SizedBox(width: 7),
                  Text("1"),
                ],
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
