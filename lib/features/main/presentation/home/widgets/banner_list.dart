import 'package:ecommerce_clean_architecture/features/main/domain/entities/featured_product_entity/featured_product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/banner_item.dart';
import 'package:flutter/material.dart';

class BannerList extends StatelessWidget {
  const BannerList({super.key, required this.featuredProducts});
 final List<FeaturedProductEntity> featuredProducts;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(featuredProducts.length, (index) => BannerItem(featuredProductEntity: featuredProducts[index])),
      ),
    );
  }
}
