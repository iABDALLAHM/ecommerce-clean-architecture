import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_states.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_dummy_products.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_items_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FruitItemsGridViewBlocBuilder extends StatelessWidget {
  const FruitItemsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, state) {
        if (state is SuccessProductsState) {
          return CustomFruitItemsGridView(products: state.products);
        } else if (state is FailureProductsState) {
          return SliverToBoxAdapter(child: Text(state.toString()));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: CustomFruitItemsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
