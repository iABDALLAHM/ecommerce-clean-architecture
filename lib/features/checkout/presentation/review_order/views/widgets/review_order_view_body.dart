import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ReviewOrderViewBody extends StatelessWidget {
  const ReviewOrderViewBody({super.key, required this.orderEntity});
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            SvgPicture.asset(Assets.imagesCheckMarkIcon),
            const SizedBox(height: 33),
            Text("تم بنجاح !", style: AppStyles.textStyle16Bold),
            const SizedBox(height: 9),
            Text(
              "رقم الطلب : ${orderEntity.orderNumber}",
              style: AppStyles.textStyle13Regular.copyWith(
                color: Color(0xff4E5556),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .35),
            SizedBox(
              height: 54,
              width: double.infinity,
              child: CustomButton(
                text: "تتبع الطلب",
                onPressed: () {
                  context.push(AppRoutes.trackOrder, extra: orderEntity);
                },
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                context.go(AppRoutes.home);
              },
              child: Text(
                "الرئيسية",
                style: AppStyles.textStyle16Bold.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
