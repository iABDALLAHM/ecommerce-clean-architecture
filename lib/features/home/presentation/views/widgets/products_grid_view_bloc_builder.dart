import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_states.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_dummy_products.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, state) {
        if (state is SuccessProductsState) {
          return ProductsGridView(products: state.products);
        } else if (state is FailureProductsState) {
          return SliverToBoxAdapter(child: Text("فشل"));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
