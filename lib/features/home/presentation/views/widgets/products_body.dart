import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/core/widgets/home_search_bar_trigger.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
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
                const SizedBox(height: 20),
                ProductsAppBar(),
                const SizedBox(height: 16),
                HomeSearchBarTrigger(),
                const SizedBox(height: 16),
                ProductsHeader(
                  productsLength: context.watch<ProductsCubit>().productsLength,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        ProductsGridViewBlocBuilder(),
      ],
    );
  }
}
