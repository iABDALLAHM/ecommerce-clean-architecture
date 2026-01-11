import 'dart:developer';

import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_state.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemStates>(
      buildWhen: (previous, current) {
        if (current is CartItemStateUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        log("message");
        return IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomItemImage(
                  imageUrl: cartItemEntity.productEntity.imageUrl,
                ),
                const SizedBox(width: 17),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: AppStyles.textStyle13Bold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${cartItemEntity.calculateTotalWeight()} كم",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: AppColors.secondryColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CartItemActionButtons(cartItemEntity: cartItemEntity),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().deleteCartItem(
                          cartItemEntity: cartItemEntity,
                        );
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: Color(0xff949D9E),
                      ),
                    ),
                    Text(
                      "${cartItemEntity.calculateTotalPrice()} جنيه ",
                      style: AppStyles.textStyle16Bold.copyWith(
                        color: AppColors.secondryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
