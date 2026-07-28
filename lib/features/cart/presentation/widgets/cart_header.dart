import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var cartItemsLenght = context.watch<CartCubit>().cartEntity.items.length;
    return Container(
      color: colorScheme.primaryContainer,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: cartItemsLenght == 0
            ? Text(
                LocaleKeys.home_cartHeaderTagWhenYouDontHaveProducts.tr(),
                style: AppStyles.textStyle13Regular.copyWith(
                  color: colorScheme.primary,
                ),
              )
            /// اعمل ايه في دي ؟!
            : Text(
                LocaleKeys.home_cartHeaderTagWhenYouHaveProducts.tr() +
                    "$cartItemsLenght",
                style: AppStyles.textStyle13Regular.copyWith(
                  color: colorScheme.primary,
                ),
              ),
      ),
    );
  }
}
