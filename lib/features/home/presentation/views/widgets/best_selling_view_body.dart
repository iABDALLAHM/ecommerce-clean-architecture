import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/best_selling_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/best_selling_view_header.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_items_grid_view.dart';
import 'package:flutter/material.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});
  static const String routeName = "bestSelling";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 20),
                BestSellingAppBar(),
                const SizedBox(height: 24),
                BestSellingViewHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        CustomFruitItemsGridView(),
      ],
    );
  }
}
