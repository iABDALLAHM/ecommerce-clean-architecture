import 'package:ecommerce_clean_architecture/core/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFruitItem extends StatefulWidget {
  const CustomFruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<CustomFruitItem> createState() => _CustomFruitItemState();
}

class _CustomFruitItemState extends State<CustomFruitItem> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xffF3F5F7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              isActive = !isActive;
              triggerAddFavoriteProductCubit(context);
              setState(() {});
            },
            child: isActive
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_outline),
          ),
          // Flexible(child: Image.network(productEntity.imageUrl)),
          const SizedBox(height: 24),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productEntity.name,
                    style: AppStyles.textStyle13SemiBold,
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${widget.productEntity.price}جنية",
                          style: AppStyles.textStyle13Bold.copyWith(
                            color: AppColors.secondryColor,
                          ),
                        ),
                        TextSpan(
                          text: " / الكيلو",
                          style: AppStyles.textStyle13Bold.copyWith(
                            color: AppColors.lightsecondryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  context.read<CartCubit>().addProduct(
                    productEntity: widget.productEntity,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: OvalBorder(),
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void triggerAddFavoriteProductCubit(BuildContext context) {
    if (isActive) {
      context.read<AddFavoriteProductCubit>().addFavoriteProduct(
        product: widget.productEntity,
      );
    }
  }
}
