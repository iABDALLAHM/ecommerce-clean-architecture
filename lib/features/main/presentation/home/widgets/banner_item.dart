import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/featured_product_entity/featured_product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/sale_and_shipping_section.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.featuredProductEntity});
  final FeaturedProductEntity featuredProductEntity;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      width: width * .911,
      child: AspectRatio(
        aspectRatio: 310 / 160,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(start: 24),
              width: width * .5,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.lightPrimaryColor,
              ),
              child: SaleAndShippingSection(),
            ),
            PositionedDirectional(
              end: 0,
              top: 0,
              bottom: 0,
              width: 140,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(featuredProductEntity.image),
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
