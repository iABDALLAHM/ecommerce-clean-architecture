import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_item.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) => CustomFruitItem(
        productEntity: ProductEntity(
          name: " ",
          price:1,
          code: "code",
          discription: "discription",
          isFeatured: true,
          imageUrl: "",
          isOrganic: true,
          expirationMonths: 3,
          numberOfCalories: 3,
          unitAmount: 3,
          averageRating: 3,
          ratingCount: 3,
          reviews: [],
          sellingCount: 3,
        ),
      ),
    );
  }
}
