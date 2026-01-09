import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) =>
          CartItem(cartItemEntity: cartItems[index]),
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: cartItems.length,
    );
  }
}
