import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_state.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/functions/calculate_average_rating.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/functions/handle_expiration_years_text.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/info_details_box.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(productEntity.productName, style: AppStyles.textStyle13SemiBold),
        const SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    "${productEntity.productPrice} ${LocaleKeys.itemDetails_itemDetailsItemPound.tr()}",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              TextSpan(
                text: " / ${LocaleKeys.itemDetails_itemDetailsItemAmount.tr()}",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: colorScheme.secondaryContainer,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        BlocBuilder<GetReviewsCubit, GetReviewsState>(
          builder: (context, state) {
            if (state is SuccessGetReviewsState) {
              return Row(
                children: [
                  Icon(Icons.star, color: colorScheme.secondary),
                  const SizedBox(width: 9),
                  Text(
                    calculateAverageRating(
                      reviews: state.productReviewWithUserEntity,
                    ).toString(),
                    style: AppStyles.textStyle13SemiBold,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    state.productReviewWithUserEntity.length > 30
                        ? "(+30)"
                        : "(${state.productReviewWithUserEntity.length})",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: colorScheme.surfaceBright,
                    ),
                  ),
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Map<String, dynamic> data = {
                        'productEntity': productEntity,
                        'AddReviewsCubit': context.read<AddReviewCubit>(),
                        'GetReviewsCubit': context.read<GetReviewsCubit>(),
                      };
                      context.push(AppRoutes.reviewAndRating, extra: data);
                    },
                    child: Text(
                      LocaleKeys.itemDetails_itemDetailsReviewItemButton.tr(),
                      style: AppStyles.textStyle13Bold.copyWith(
                        color: colorScheme.primary,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is LoadingGetReviewsState) {
              return Text(
                LocaleKeys.itemDetailsStatus_loadingReviewsForThisItem.tr(),
              );
            } else if (state is EmptyGetReviewsState) {
              return Row(
                children: [
                  Text(
                    LocaleKeys.itemDetailsStatus_beTheFirstOneToAddReview.tr(),
                    style: AppStyles.textStyle13Bold,
                  ),
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Map<String, dynamic> data = {
                        'productEntity': productEntity,
                        'AddReviewsCubit': context.read<AddReviewCubit>(),
                        'GetReviewsCubit': context.read<GetReviewsCubit>(),
                      };
                      context.push(AppRoutes.reviewAndRating, extra: data);
                    },
                    child: Text(
                      LocaleKeys.itemDetails_itemDetailsReviewItemButton.tr(),
                      style: AppStyles.textStyle13Bold.copyWith(
                        color: colorScheme.primary,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),

        const SizedBox(height: 8),

        Text(
          productEntity.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textStyle13Regular.copyWith(
            color: colorScheme.surfaceBright,
          ),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: InfoDetailsBox(
                icon: Assets.imagesCalenderIcon,
                title: handleExpirationYearsText(
                  numOfYears: productEntity.expirationYears,
                ),
                subTitle: LocaleKeys.itemDetails_itemDetailsExpirationDate.tr(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InfoDetailsBox(
                icon: Assets.imagesIsOrganicIcon,
                title: productEntity.isOrganicProduct == false ? "0%" : "100%",
                subTitle: LocaleKeys.itemDetails_itemDetailsOrganicItem.tr(),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: InfoDetailsBox(
                icon: Assets.imagesCaloryIcon,
                title:
                    "${productEntity.numberOfCalories} ${LocaleKeys.itemDetails_itemDetailsCaloryItem.tr()}",
                subTitle: LocaleKeys.itemDetails_itemDetailsCaloryBy100GM.tr(),
              ),
            ),
            const SizedBox(width: 16),

            BlocBuilder<GetReviewsCubit, GetReviewsState>(
              builder: (context, state) {
                if (state is SuccessGetReviewsState) {
                  return Expanded(
                    child: InfoDetailsBox(
                      icon: Assets.imagesStarIcon,
                      title: calculateAverageRating(
                        reviews: state.productReviewWithUserEntity,
                      ).toString(),
                      titleDetails:
                          "(${state.productReviewWithUserEntity.length}) ",
                      subTitle: LocaleKeys.itemDetails_itemDetailsReviewsItem
                          .tr(),
                    ),
                  );
                } else if (state is LoadingGetReviewsState) {
                  return Center(child: CustomCircularProgressWidget());
                } else if (state is EmptyGetReviewsState) {
                  return Expanded(
                    child: InfoDetailsBox(
                      icon: Assets.imagesStarIcon,
                      title: LocaleKeys.itemDetailsStatus_nothing.tr(),
                      subTitle: LocaleKeys.itemDetails_itemDetailsReviewsItem
                          .tr(),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),

        const SizedBox(height: 24),

        SizedBox(
          height: 54,
          width: double.infinity,
          child: CustomButton(
            text: LocaleKeys.itemDetails_itemDetailsAddToCartButton.tr(),
            onPressed: () {
              context.read<CartCubit>().addProduct(
                productEntity: productEntity,
              );
            },
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
