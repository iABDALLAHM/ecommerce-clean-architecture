import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/cart_header.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/cart_items_list_view.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    var items = context.watch<CartCubit>().cartEntity.items;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16),
                CartAppBar(),
                const SizedBox(height: 16),
                CartHeader(),
                const SizedBox(height: 24),
              ],
            ),
          ),
          items.isNotEmpty
              ? SliverToBoxAdapter(child: CustomDivider())
              : SliverToBoxAdapter(child: SizedBox()),

          CartItemsListView(cartItems: items),

          items.isNotEmpty
              ? SliverToBoxAdapter(child: CustomDivider())
              : SliverToBoxAdapter(child: SizedBox()),

          SliverToBoxAdapter(child: SizedBox(height: height * .3)),

          items.isEmpty
              ? SliverToBoxAdapter(child: SizedBox())
              : SliverToBoxAdapter(
                  child: SizedBox(
                    height: 54,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomCartButton(),
                    ),
                  ),
                ),

          SliverToBoxAdapter(child: SizedBox(height: 67)),
        ],
      ),
    );
  }
}
