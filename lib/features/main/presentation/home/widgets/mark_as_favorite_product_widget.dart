import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
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

    return GestureDetector(
      onTap: () => context.read<AddFavoriteProductCubit>().toggleFavorite(
        product: productEntity,
      ),
      child: isFavorited
          ? Icon(Icons.favorite, color: AppColors.primaryColor)
          : Icon(Icons.favorite_outline),
    );
  }
}
