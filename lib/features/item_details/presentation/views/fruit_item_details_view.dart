import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/fruit_item_details_view_body.dart';
import 'package:flutter/material.dart';

class FruitItemDetailsView extends StatelessWidget {
  const FruitItemDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FruitItemDetailsViewBody(productEntity: productEntity),
    );
  }
}
