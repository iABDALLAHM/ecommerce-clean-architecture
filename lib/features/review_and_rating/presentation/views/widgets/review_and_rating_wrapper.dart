import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/review_and_rating_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewAndRatingWrapper extends StatelessWidget {
  const ReviewAndRatingWrapper({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: data["GetReviewsCubit"] as GetReviewsCubit),
        BlocProvider.value(value: data["AddReviewsCubit"] as AddReviewCubit),
      ],
      child: ReviewAndRatingView(productEntity: data["productEntity"]),
    );
  }
}
