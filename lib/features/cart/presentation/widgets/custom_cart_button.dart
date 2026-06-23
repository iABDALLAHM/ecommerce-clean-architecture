import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text:
          "دفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice().round()} جنيه مصري",
      onPressed: () {
        handleIfCartIsNotEmpty(context);
      },
    );
  }

  void handleIfCartIsNotEmpty(BuildContext context) {
    if (context.read<CartCubit>().cartEntity.items.isNotEmpty) {
      context.push(
        AppRoutes.checkOut,
        extra: context.read<CartCubit>().cartEntity,
      );
    }
  }
}
