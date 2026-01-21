import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/main_view.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/track_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewOrderViewBody extends StatelessWidget {
  const ReviewOrderViewBody({super.key});

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
              "رقم الطلب : 1245789663#",
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
                  Navigator.of(context).pushNamed(TrackOrderView.routeName);
                },
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(MainView.routeName);
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
