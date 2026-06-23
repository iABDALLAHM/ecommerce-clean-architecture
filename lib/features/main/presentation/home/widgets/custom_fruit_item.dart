import 'dart:developer';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_states.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/mark_as_favorite_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomFruitItem extends StatelessWidget {
  const CustomFruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartStates>(
      listenWhen: (previous, current) {
        log(current.toString());
        if (current is ProductAddedState) {
          if (current.cartItemEntity.productEntity == productEntity) {
            return true;
          }
        }
        if (current is LoadingAddProductState) {
          if (current.cartItemEntity.productEntity == productEntity) {
            return true;
          }
        }
        if (current is ProductIncreaseState) {
          if (current.cartItemEntity.productEntity == productEntity) {
            return true;
          }
        }
        return false;
      },
      listener: (context, state) {
        
        if (state is ProductAddedState) {
          showSnackBar(context, message: "تم إضافة المنتج بنجاح");
        } else if (state is LoadingAddProductState) {
          showSnackBar(context, message: "جاري اضافة المنتج للعربة");
        } else if (state is ProductIncreaseState) {
          showSnackBar(context, message: "تم زيادة الكمية بنجاح");
        }
      },
      child: GestureDetector(
        onTap: () {
          context.push(AppRoutes.itemDetails, extra: productEntity);
        },
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xffF3F5F7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              MarkAsFavoriteProductWidget(productEntity: productEntity),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image);
                    },
                    productEntity.productImageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.productName,
                        style: AppStyles.textStyle13SemiBold,
                      ),
                      const SizedBox(height: 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${productEntity.productPrice}جنية",
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
                        productEntity: productEntity,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: OvalBorder(),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 28),
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
