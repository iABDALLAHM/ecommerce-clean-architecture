import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/sale_and_shipping_section.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.amber,
      ),
      width: width * .911,
      child: AspectRatio(
        aspectRatio: 310 / 160,
        child: Stack(
          children: [

            Container(
              padding: EdgeInsets.only(right: 25),
              width: width * .5,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.lightPrimaryColor,
              ),
              child: SaleAndShippingSection(),
            ),

            Positioned(
              right: 195,
              left: 0,
              top: 0,
              bottom: 0,
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

          ],
        ),
      ),
    );
  }
}
