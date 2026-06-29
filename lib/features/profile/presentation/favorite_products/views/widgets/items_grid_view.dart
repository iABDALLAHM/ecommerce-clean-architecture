import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/custom_fruit_item.dart';
import 'package:flutter/widgets.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163 / 214,
        crossAxisCount: 2,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomFruitItem(productEntity: products[index]);
      },
    );
  }
}
