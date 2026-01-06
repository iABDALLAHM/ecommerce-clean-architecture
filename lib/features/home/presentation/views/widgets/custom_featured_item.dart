import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFeaturedItem extends StatelessWidget {
  const CustomFeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      color: Colors.red,
      width: width,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              child: SvgPicture.asset(
                width: width * 0.49,
                Assets.imagesFeaturedItemBackground,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 0,
              right: 150,
              bottom: 0,
              left: 0,
              child: Container(
                width: width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(Assets.imagesWatermelonForTest),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    "عروض العيد",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Spacer(),
                  Text(
                    "خصم 25%",
                    style: AppStyles.textStyle19Bold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  FeaturedItemButton(),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
