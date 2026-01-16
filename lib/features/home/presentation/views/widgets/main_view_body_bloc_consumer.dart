import 'package:ecommerce_clean_architecture/core/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/add_favorite_product_cubit/add_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartCubit, CartStates>(
          listener: (context, state) {
            if (state is ProductAddedState) {
              showSnackBar(context, message: "تم إضافة المنتج بنجاح");
            } else if (state is ProductRemovedState) {
              showSnackBar(context, message: "تم ازالة المنتج من العربة");
            } else if (state is ProductExistState) {
              showSnackBar(context, message: "المنتج موجود بالفعل");
            }
          },
        ),
        BlocListener<AddFavoriteProductCubit, AddFavoriteProductStates>(
          listener: (context, state) {
            if (state is SuccessAddFavoriteProductState) {
              showSnackBar(context, message: "تم إضافة المنتج للمفضلة");
            }
          },
        ),
      ],
      child: child,
    );
  }
}
