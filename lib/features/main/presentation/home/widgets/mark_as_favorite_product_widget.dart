import 'dart:developer';

import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarkAsFavoriteProductWidget extends StatelessWidget {
  const MarkAsFavoriteProductWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    bool isFavorited = context.watch<AddFavoriteProductCubit>().isFavorited(
      product: productEntity,
    );

    return BlocListener<AddFavoriteProductCubit, FavoriteProductStates>(
      listenWhen: (previous, current) {
        if (current is SuccessAddFavoriteProduct) {
          if (current.productEntity == productEntity) {
            return true;
          }
        } else if (current is SuccessRemoveFavoriteProduct) {
          if (current.productEntity == productEntity) {
            return true;
          }
        }
        return false;
      },
      listener: (context, state) {
        log("message");
        if (state is SuccessAddFavoriteProduct) {
          showSnackBar(context, message: "تم إضافة المنتج للمفضلة");
        } else if (state is SuccessRemoveFavoriteProduct) {
          showSnackBar(context, message: "تم إزالة المنتج من المفضلة");
        } else if (state is FailureAddFavoriteProduct) {
          showSnackBar(context, message: state.errorMessage);
        } else if (state is FailureRemoveFavoriteProduct) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: GestureDetector(
        onTap: () => context.read<AddFavoriteProductCubit>().toggleFavorite(
          product: productEntity,
        ),
        child: isFavorited
            ? Icon(Icons.favorite, color: AppColors.primaryColor)
            : Icon(Icons.favorite_outline),
      ),
    );
  }
}
