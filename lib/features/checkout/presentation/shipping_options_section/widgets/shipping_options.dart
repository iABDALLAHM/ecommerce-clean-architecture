import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/shipping_options_section/widgets/shipping_item.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingOptions extends StatelessWidget {
  const ShippingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var checkOutCubit = context.read<CheckOutCubit>();

    var totalPrice = context
        .read<CheckOutCubit>()
        .orderEntity
        .cartEntity
        .calculateTotalPrice()
        .round()
        .toInt();

    var orderEntity = context.watch<CheckOutCubit>().orderEntity;

    return Column(
      children: [
        ShippingItem(
          onPressed: () {
            checkOutCubit.updateShippingOptions(payWith: true);
          },
          isSelected: orderEntity.payWithCash == true ? true : false,
          title: LocaleKeys.checkOut_cashOnDelivery.tr(),
          subTitle: LocaleKeys.checkOut_DeliveryFromLocation.tr(),
          price: totalPrice + 40,
        ),
        const SizedBox(height: 8),
        ShippingItem(
          onPressed: () {
            checkOutCubit.updateShippingOptions(payWith: false);
          },
          isSelected: orderEntity.payWithCash == false ? true : false,
          title: LocaleKeys.checkOut_buyNowPayLater.tr(),
          subTitle: LocaleKeys.checkOut_yourPaymentMethod.tr(),
        ),
      ],
    );
  }
}
