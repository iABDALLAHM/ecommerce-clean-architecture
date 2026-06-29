import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/cubits/get_favorite_products_cubit/get_favorite_products_states.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/views/widgets/items_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  void initState() {
    context.read<GetFavoriteProductsCubit>().getFavoriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteProductsCubit, GetFavoriteProductsStates>(
      builder: (context, state) {
        if (state is SuccessGetFavoriteProductsState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ItemsGridView(products: state.productsList),
          );
        } else if (state is LoadingGetFavoriteProductsState) {
          return CustomCircularProgressWidget();
        } else if (state is FailureGetFavoriteProductsState) {
          return Text(state.errorMessage);
        } else if (state is EmptyFavoriteProductsState) {
          return Center(
            child: Text(
              "لا يوجد منتجات مفضلة لديك",
              style: AppStyles.textStyle13SemiBold.copyWith(
                color: AppColors.lightPrimaryColor,
                fontSize: 20,
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
