import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text:
          "${LocaleKeys.cart_payButton.tr(context: context)} ${LocaleKeys.common_priceWithCurrency.tr(namedArgs: {'price': context.watch<CartCubit>().cartEntity.calculateTotalPrice().round().toString()}, context: context)}",
      onPressed: () {
        handleIfCartIsNotEmpty(context);
      },
    );
  }

  void handleIfCartIsNotEmpty(BuildContext context) {
    if (context.read<CartCubit>().cartEntity.items.isNotEmpty) {
      final cartCubit = context.read<CartCubit>();
      final cartEntity = context.read<CartCubit>().cartEntity;

      context.push(
        AppRoutes.checkOut,
        extra: {"cartCubit": cartCubit, "cartEntity": cartEntity},
      );
    }
  }
}
