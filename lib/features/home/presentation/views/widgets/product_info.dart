import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/review_and_rating_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/decreent_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/increment_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/info_details_box.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.productName,
                  style: AppStyles.textStyle13SemiBold,
                ),
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
              ],
            ),
            Spacer(),
            Row(
              children: [
                IncrementButton(onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("3"),
                ),
                DecrementButton(onPressed: () {}),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            const SizedBox(width: 9),
            Text(
              "${productEntity.averageRating}",
              style: AppStyles.textStyle13SemiBold,
            ),
            const SizedBox(width: 9),
            Text(
              "(${productEntity.reviews.length}+)",
              style: AppStyles.textStyle13Regular.copyWith(
                color: Color(0xff9796A1),
              ),
            ),
            const SizedBox(width: 9),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ReviewAndRatingView.routeName);
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
        ),
        const SizedBox(height: 8),
        Text(
          productEntity.productDiscription,
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
                title: expirationYearsText(
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
                subTitle: "1 كج",
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InfoDetailsBox(
                icon: Assets.imagesStarIcon,
                title: "4.8  ",
                titleDetails: "(${productEntity.reviews.length}) ",
                subTitle: "Reviews",
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        SizedBox(
          height: 54,
          width: double.infinity,
          child: CustomButton(text: "أضف الي السلة", onPressed: () {}),
        ),
      ],
    );
  }

  String expirationYearsText({required int numOfYears}) {
    switch (numOfYears) {
      case 1:
        return "عام";
      case 2:
        return "عامين";
      case 3:
        return "3 اعوام";
      case 4:
        return "4 اعوام";
      default:
        return "";
    }
  }
}
