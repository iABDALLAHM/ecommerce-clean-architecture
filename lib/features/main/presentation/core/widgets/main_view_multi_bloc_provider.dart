import 'package:ecommerce_clean_architecture/features/auth/data/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/cubits/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiMainViewBlocProvider extends StatelessWidget {
  const MultiMainViewBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => CartItemCubit()),

        BlocProvider.value(
          value: UpdateUserImageCubit(
            imagesRepo: getIt.get<ImagesRepository>(),
          ),
        ),

        // create products cubit
        BlocProvider(
          create: (context) =>
              ProductsCubit(productsRepo: getIt.get<ProductsRepository>()),
        ),

        BlocProvider.value(
          value: UpdateUserPasswordCubit(authRepo: getIt.get<AuthRepository>()),
        ),

        BlocProvider(create: (context) => CartCubit()),

        BlocProvider(
          create: (context) =>
              SearchCubit(productsRepo: getIt.get<ProductsRepository>()),
        ),

        BlocProvider(
          create: (context) => AddFavoriteProductCubit(
            productsRepo: getIt.get<ProductsRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
