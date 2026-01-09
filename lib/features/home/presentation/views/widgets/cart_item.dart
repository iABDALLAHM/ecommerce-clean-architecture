import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_item_image.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/decreent_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/increment_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomItemImage(),
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
                Row(
                  children: [
                    IncrementButton(),
                    const SizedBox(width: 16),
                    Text("3", style: AppStyles.textStyle16Bold),
                    const SizedBox(width: 16),
                    DecrementButton(),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.delete_outline, color: Color(0xff949D9E)),
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
  }
}
