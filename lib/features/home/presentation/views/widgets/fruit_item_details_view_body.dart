import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/fruit_item_details_header.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/product_info.dart';
import 'package:flutter/material.dart';

class FruitItemDetailsViewBody extends StatelessWidget {
  const FruitItemDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: height * 0.5,
            width: width,
            child: FruitItemDetailsHeader(imageUrl: productEntity.productImageUrl),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: ProductInfo(productEntity: productEntity),
          ),
        ),
      ],
    );
  }
}
