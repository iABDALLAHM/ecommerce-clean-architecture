import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_state.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/add_review_text_field.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/review_summary_section.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/reviews_list_view.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewAndRatingViewBody extends StatefulWidget {
  const ReviewAndRatingViewBody({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<ReviewAndRatingViewBody> createState() =>
      _ReviewAndRatingViewBodyState();
}

class _ReviewAndRatingViewBodyState extends State<ReviewAndRatingViewBody> {
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

                AddReviewTextField(productEntity: widget.productEntity),

                const SizedBox(height: 16),

                BlocBuilder<GetReviewsCubit, GetReviewsState>(
                  builder: (context, state) {
                    if (state is SuccessGetReviewsState) {
                      return Text(
                        "${state.productReviewWithUserEntity.length} ${LocaleKeys.reviewAndRating_reviewAndRatingReviewsText.tr()}",
                        style: AppStyles.textStyle13Bold,
                      );
                    } else if (state is LoadingGetReviewsState) {
                      return Text(
                        LocaleKeys.reviewAndRatingStatus_loadingGetReviews.tr(),
                        style: AppStyles.textStyle13Bold,
                      );
                    } else if (state is FailureGetReviewsState) {
                      return Text(
                        state.errorMessage,
                        style: AppStyles.textStyle13Bold,
                      );
                    } else if (state is EmptyGetReviewsState) {
                      return Text(
                        LocaleKeys.reviewAndRatingStatus_beTheFirstOnetoReview
                            .tr(),
                        style: AppStyles.textStyle13Bold,
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),

                const SizedBox(height: 5),
                ReviewsSummarySection(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: CustomDivider()),

        ReviewsListView(),

        SliverToBoxAdapter(child: SizedBox(height: 10)),
      ],
    );
  }
}
