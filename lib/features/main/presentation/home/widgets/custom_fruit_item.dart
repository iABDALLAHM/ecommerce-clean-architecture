import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/mark_as_favorite_product_widget.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomFruitItem extends StatelessWidget {
  const CustomFruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Map<String, dynamic> data = {
          "CartCubit": context.read<CartCubit>(),
          "ProductEntity": productEntity,
        };
        context.push(AppRoutes.itemDetails, extra: data);
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 8,
          end: 8,
          top: 8,
          bottom: 19,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xffF3F5F7),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                alignment: Alignment.center,
                productEntity.productImageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarkAsFavoriteProductWidget(productEntity: productEntity),
                Spacer(),
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
                                text:
                                    "${productEntity.productPrice} ${LocaleKeys.home_egypyPound.tr()}",
                                style: AppStyles.textStyle13Bold.copyWith(
                                  color: AppColors.secondryColor,
                                ),
                              ),
                              TextSpan(
                                text: " / ${LocaleKeys.home_amount.tr()}",
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
          ],
        ),
      ),
    );
  }
}
