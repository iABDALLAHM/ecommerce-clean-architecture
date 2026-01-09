import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyBlocProvider extends StatelessWidget {
  const HomeBodyBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(productsRepo: getIt.get<ProductsRepo>()),
      child: child,
    );
  }
}
