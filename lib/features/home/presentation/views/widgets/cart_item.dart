import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit.dart/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_item_image.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/decreent_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/increment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomItemImage(
              imageUrl: widget.cartItemEntity.productEntity.imageUrl,
            ),
            const SizedBox(width: 17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cartItemEntity.productEntity.name,
                  style: AppStyles.textStyle13Bold,
                ),
                const SizedBox(height: 4),
                Text(
                  "${widget.cartItemEntity.calculateTotalWeight()} كم",
                  style: AppStyles.textStyle13Regular.copyWith(
                    color: AppColors.secondryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    IncrementButton(
                      onPressed: () {
                        widget.cartItemEntity.increaseCount();
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "${widget.cartItemEntity.count}",
                      style: AppStyles.textStyle16Bold,
                    ),
                    const SizedBox(width: 16),
                    DecrementButton(
                      onPressed: () {
                        widget.cartItemEntity.decreaseCount();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().deleteCartItem(cartItemEntity: widget.cartItemEntity);
                  },
                  child: Icon(Icons.delete_outline, color: Color(0xff949D9E))),
                Text(
                  "${widget.cartItemEntity.calculateTotalPrice()} جنيه ",
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
  }
}
