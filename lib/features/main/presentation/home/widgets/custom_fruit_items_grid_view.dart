import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/custom_fruit_item.dart';
import 'package:flutter/material.dart';

class CustomFruitItemsGridView extends StatelessWidget {
  const CustomFruitItemsGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163 / 214,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) =>
          CustomFruitItem(productEntity: products[index]),
    );
  }
}
