import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => CartItem(),
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: 10,
    );
  }
}
