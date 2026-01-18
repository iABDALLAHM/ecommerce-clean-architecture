import 'package:ecommerce_clean_architecture/core/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce_clean_architecture/core/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiMainViewBlocProvider extends StatelessWidget {
  const MultiMainViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) => GetNotificationsCubit(
            notificationRepo: getIt.get<NotificationRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              UpdateUserImageCubit(imagesRepo: getIt.get<ImagesRepo>()),
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
