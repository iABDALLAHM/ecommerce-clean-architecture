import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/best_selling/widgets/best_selling_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/best_selling/widgets/best_selling_view_header.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/widgets/fruit_items_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
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
          FruitItemsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
