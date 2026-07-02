import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_state.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/functions/calculate_average_rating.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/functions/handle_expiration_years_text.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/info_details_box.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
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
                text: "${productEntity.productPrice}جنية",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: AppColors.secondryColor,
                ),
              ),
              TextSpan(
                text: " / الكيلو",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: AppColors.lightsecondryColor,
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
                  Icon(Icons.star, color: Colors.amber),
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
                        : "(${ state.productReviewWithUserEntity.length})",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff9796A1),
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
                      "المراجعه",
                      style: AppStyles.textStyle13Bold.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is LoadingGetReviewsState) {
              return Text("يتم تحميل التقيمات لهذا المنتج");
            } else if (state is EmptyGetReviewsState) {
              return Row(
                children: [
                  Text(
                    "كن اول من يضع تعليقا",
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
                      "المراجعه",
                      style: AppStyles.textStyle13Bold.copyWith(
                        color: AppColors.primaryColor,
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
            color: Color(0xff979899),
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
                subTitle: "الصلاحيه",
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InfoDetailsBox(
                icon: Assets.imagesIsOrganicIcon,
                title: productEntity.isOrganicProduct == false ? "0%" : "100%",
                subTitle: "اورجانيك",
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
                title: "${productEntity.numberOfCalories} كالوري",
                subTitle: "100 جرام",
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
                        reviews:  state.productReviewWithUserEntity,
                      ).toString(),
                      titleDetails: "(${ state.productReviewWithUserEntity.length}) ",
                      subTitle: "Reviews",
                    ),
                  );
                } else if (state is LoadingGetReviewsState) {
                  return Center(child: CustomCircularProgressWidget());
                } else if (state is EmptyGetReviewsState) {
                  return Expanded(
                    child: InfoDetailsBox(
                      icon: Assets.imagesStarIcon,
                      title: "لا يوجد",
                      subTitle: "Reviews",
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
            text: "أضف الي السلة",
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
