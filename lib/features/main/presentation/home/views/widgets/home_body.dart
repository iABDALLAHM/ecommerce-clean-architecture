import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/core/widgets/search_bar_trigger.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/best_selling/views/widgets/best_selling_header.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/views/widgets/custom_featured_list.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/views/widgets/custom_home_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/fruit_items_grid_view_bloc_builder.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/views/widgets/home_body_bloc_listener.dart';
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
    return SafeArea(
      child: HomeBodyBlocListener(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    CustomHomeAppBar(),
                    const SizedBox(height: 16),
                    SearchBarTrigger(fromRoute: AppRoutes.home),
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
            SliverToBoxAdapter(child: const SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}
