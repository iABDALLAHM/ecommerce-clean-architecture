import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/decrement_button.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/increment_button.dart';
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
            context.read<CartCubit>().increaseCartItem(
              cartItemEntity: cartItemEntity,
            );
          },
        ),
        const SizedBox(width: 16),
        Text("${cartItemEntity.count}", style: AppStyles.textStyle16Bold),
        const SizedBox(width: 16),
        DecrementButton(
          onPressed: () {
            context.read<CartCubit>().decreaseCartItem(
              cartItemEntity: cartItemEntity,
            );
          },
        ),
      ],
    );
  }
}
