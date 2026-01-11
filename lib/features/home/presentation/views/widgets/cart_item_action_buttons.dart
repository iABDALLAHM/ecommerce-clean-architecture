import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/decreent_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/increment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IncrementButton(
          onPressed: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(
              cartItemEntity: cartItemEntity,
            );
          },
        ),
        const SizedBox(width: 16),
        Text("${cartItemEntity.count}", style: AppStyles.textStyle16Bold),
        const SizedBox(width: 16),
        DecrementButton(
          onPressed: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(
              cartItemEntity: cartItemEntity,
            );
          },
        ),
      ],
    );
  }
}
