import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_states.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/cart_item_action_buttons.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/custom_item_image.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return BlocListener<CartCubit, CartStates>(
      listenWhen: (previous, current) {
        if (current is ProductIncreaseState) {
          return current.cartItemEntity == cartItemEntity;
        } else if (current is ProductDecreaseState) {
          return current.cartItemEntity == cartItemEntity;
        }
        return false;
      },
      listener: (context, state) {
        log("widget build");
        if (state is ProductIncreaseState) {
          showSnackBar(
            context,
            message:
                "${LocaleKeys.cartCubit_cartItemIncremented.tr()} ${cartItemEntity.productEntity.productName}",
          );
        } else if (state is ProductDecreaseState) {
          showSnackBar(
            context,
            message:
                "${LocaleKeys.cartCubit_cartItemDecremented.tr()} ${cartItemEntity.productEntity.productName}",
          );
        }
      },
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomItemImage(
                imageUrl: cartItemEntity.productEntity.productImageUrl,
              ),
              const SizedBox(width: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItemEntity.productEntity.productName,
                    style: AppStyles.textStyle13Bold,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${cartItemEntity.quantity} ${LocaleKeys.cart_cartAmount.tr()}",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: colorScheme.secondaryContainer,
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
                      color: colorScheme.tertiaryContainer,
                    ),
                  ),
                  Text(
                    "${cartItemEntity.calculateTotalPrice()} ${LocaleKeys.cart_cartCurrency.tr()}",
                    style: AppStyles.textStyle16Bold.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
