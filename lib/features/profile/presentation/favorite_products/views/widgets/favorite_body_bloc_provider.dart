import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBodyBlocProvider extends StatelessWidget {
  const FavoriteBodyBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => GetFavoriteProductsCubit(productsRepo: getIt.get<ProductsRepository>()) ,child: child);
  }
}
