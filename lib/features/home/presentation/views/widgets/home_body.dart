import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_search_field.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_featured_list.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/fruit_items_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 16),
                CustomHomeAppBar(),
                const SizedBox(height: 16),
                CustomSearchField(),
                const SizedBox(height: 12),
                CustomFeaturedList(),
                const SizedBox(height: 12),
                BestSellingHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        FruitItemsGridViewBlocBuilder(),
      ],
    );
  }
}
