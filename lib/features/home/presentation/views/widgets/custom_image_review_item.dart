import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomImageReviewItem extends StatelessWidget {
  const CustomImageReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(width: 50, height: 50, Assets.imagesProfileImage),
        Positioned(
          bottom: 3,
          right: -6,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "5.0",
              style: AppStyles.textStyle11SemiBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}