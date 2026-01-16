import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/sale_and_shipping_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFeaturedItem extends StatelessWidget {
  const CustomFeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 330 / 158,
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
              child: SaleAndShippingSection(),
            ),
          ],
        ),
      ),
    );
  }
}
