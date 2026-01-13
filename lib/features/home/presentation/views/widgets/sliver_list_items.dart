import 'package:ecommerce_clean_architecture/core/functions/get_dummy_products.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_item.dart';
import 'package:flutter/widgets.dart';

class SliverListItems extends StatelessWidget {
  const SliverListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        childAspectRatio: 163 / 214,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomFruitItem(productEntity: dummyProduct());
      },
    );
  }
}
