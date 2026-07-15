import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/widgets/search_bar_trigger.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/products_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/products_grid_view_bloc_builder.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/products_header.dart';
import 'package:flutter/material.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key});

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
                  ProductsAppBar(),
                  const SizedBox(height: 16),
                  SearchBarTrigger(fromRoute: AppRoutes.products),
                  const SizedBox(height: 16),
                  ProductsHeader(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            sliver: ProductsGridViewBlocBuilder(),
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
        ],
      ),
    );
  }
}
