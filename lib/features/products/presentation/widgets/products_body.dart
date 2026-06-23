import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_states.dart';
import 'package:ecommerce_clean_architecture/core/widgets/search_bar_trigger.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/products_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/products_grid_view_bloc_builder.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/products_header.dart';
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
                  BlocBuilder<ProductsCubit, ProductsStates>(
                    builder: (context, state) {
                      if (state is SuccessProductsState) {
                        return ProductsHeader(
                          productsLength: state.products.length,
                        );
                      }
                      return Text("جاري البحث عن المنتجات");
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
