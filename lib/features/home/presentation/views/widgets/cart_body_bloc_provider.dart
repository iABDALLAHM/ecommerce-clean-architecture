import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBodyBlocProvider extends StatelessWidget {
  const CartBodyBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: child,
    );
  }
}
