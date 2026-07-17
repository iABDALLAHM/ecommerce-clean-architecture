import 'dart:developer';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_states.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/cart_item_action_buttons.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/custom_item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
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
                "تم زيادة عدد ال ${cartItemEntity.productEntity.productName}",
          );
        } else if (state is ProductDecreaseState) {
          showSnackBar(
            context,
            message:
                "تم تقليل عدد ال ${cartItemEntity.productEntity.productName}",
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
                    "${cartItemEntity.quantity} كم",
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
                    child: Icon(Icons.delete_outline, color: Color(0xff949D9E)),
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
      ),
    );
  }
}
