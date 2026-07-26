import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/featured_products_repository/featured_products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/get_featured_product_cubit/get_featured_product_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewMultiBlocProvider extends StatelessWidget {
  const MainViewMultiBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNotificationsCubit(
            notificationRepo: getIt.get<NotificationRepository>(),
          ),
        ),

        BlocProvider(create: (context) => CartCubit()),

        BlocProvider(
          create: (context) => GetFeaturedProductCubit(
            featuredProductsRepository: getIt.get<FeaturedProductsRepository>(),
          ),
        ),

        BlocProvider(
          create: (context) => ProductsCubit(
            productsRepository: getIt.get<ProductsRepository>(),
          ),
        ),

        BlocProvider(
          create: (context) =>
              SearchCubit(productsRepo: getIt.get<ProductsRepository>()),
        ),

        BlocProvider(
          create: (context) => AddFavoriteProductCubit(
            productsRepository: getIt.get<ProductsRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
