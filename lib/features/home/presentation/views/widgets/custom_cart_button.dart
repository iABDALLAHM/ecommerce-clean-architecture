import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/check_out_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemStates>(
      builder: (context, state) => CustomButton(
        text:
            "دفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice().round()} جنيه مصري",
        onPressed: () {
          if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
            Navigator.of(context).pushNamed(
              CheckOutView.routeName,
              arguments: context.read<CartCubit>().cartEntity,
            );
          } else {
            showSnackBar(context, message: "العربة فارغة");
          }
        },
      ),
    );
  }
}
