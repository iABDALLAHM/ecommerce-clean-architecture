import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_state.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewsCubit, GetReviewsState>(
      builder: (context, state) {
        if (state is SuccessGetReviewsState) {
          return SliverList.separated(
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomDivider(),
            ),
            itemCount: state.productReviewsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 16, left: 16),
                child: ReviewItem(
                  productReviewEntity: state.productReviewsList[index],
                ),
              );
            },
          );
        } else if (state is LoadingGetReviewsState) {
          return SliverToBoxAdapter(
            child: Center(child: CustomCircularProgressWidget()),
          );
        } else if (state is FailureGetReviewsState) {
          return SliverToBoxAdapter(child: Text(state.errorMessage));
        } else if (state is EmptyGetReviewsState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                "كن اول من يضيف تقييما",
                style: AppStyles.textStyle13Bold,
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
