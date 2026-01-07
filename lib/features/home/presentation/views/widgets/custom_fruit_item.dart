import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomFruitItem extends StatelessWidget {
  const CustomFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xffF3F5F7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.favorite_outline),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesWatermelonForTest)],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("بطيخ"),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "20جنية",
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
              Container(
                padding: EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: OvalBorder(),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
