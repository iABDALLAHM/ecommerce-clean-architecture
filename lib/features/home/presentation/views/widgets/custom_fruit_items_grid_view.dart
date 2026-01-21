import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_item.dart';
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
      ),
      itemBuilder: (context, index) =>
          SizedBox(child: CustomFruitItem(productEntity: products[index])),
    );
  }
}
