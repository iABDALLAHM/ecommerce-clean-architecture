import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_header.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_items_list_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        CartItemsListView(
          cartItems: context.watch<CartCubit>().cartEntity.cartItems,
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 54,
            width: double.infinity,
            child: CustomCartButton(),
          ),
        ),
      ],
    );
  }
}
