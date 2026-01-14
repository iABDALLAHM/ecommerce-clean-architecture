import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:flutter/material.dart';

class FruitItemDetailsView extends StatelessWidget {
  const FruitItemDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  static const String routeName = "FruitItemDetails";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Abdallah")),
      // body: FruitItemDetailsViewBody(),
    );
  }
}
