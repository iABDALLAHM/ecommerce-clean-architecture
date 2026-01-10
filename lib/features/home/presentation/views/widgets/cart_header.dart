import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit.dart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEBF9F1),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          "لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق",
          style: AppStyles.textStyle13Regular.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
