import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/home/domain/repos/images_repo.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/domain/repos/products_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/manager/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/manager/update_user_password_cubit/update_user_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiMainViewBlocProvider extends StatelessWidget {
  const MultiMainViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
                BlocProvider.value(
          value: UpdateUserImageCubit(imagesRepo: getIt.get<ImagesRepo>()),
        ),
        BlocProvider.value(
          value: UpdateUserPasswordCubit(authRepo: getIt.get<AuthRepo>()),
        ),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) =>
              SearchCubit(productsRepo: getIt.get<ProductsRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              AddFavoriteProductCubit(productsRepo: getIt.get<ProductsRepo>()),
        ),
      ],
      child: child,
    );
  }
}
