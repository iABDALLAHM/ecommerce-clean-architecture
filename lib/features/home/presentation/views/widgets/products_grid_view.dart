import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_item.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) =>
          CustomFruitItem(productEntity: products[index]),
    );
  }
}
