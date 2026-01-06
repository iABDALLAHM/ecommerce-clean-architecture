import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_featured_item.dart';
import 'package:flutter/material.dart';

class CustomFeaturedList extends StatelessWidget {
  const CustomFeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(3, (item) => CustomFeaturedItem())),
    );
  }
}
