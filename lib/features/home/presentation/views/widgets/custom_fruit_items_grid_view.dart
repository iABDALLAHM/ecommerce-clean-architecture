
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_item.dart';
import 'package:flutter/material.dart';

class CustomFruitItemsGridView extends StatelessWidget {
  const CustomFruitItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomFruitItem(),
      ),
    );
  }
}
