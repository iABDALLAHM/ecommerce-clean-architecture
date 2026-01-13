import 'package:ecommerce_clean_architecture/core/cubits/get_favorite_products_cubit/get_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePageBlocProvider extends StatelessWidget {
  const FavoritePageBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=> GetFavoriteProductCubit(productsRepo: getIt.get<ProductsRepo>()),child: child,);
  }
}