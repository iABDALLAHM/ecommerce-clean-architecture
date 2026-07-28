import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSummary extends StatelessWidget {
  const AddressSummary({super.key});

  @override
  Widget build(BuildContext context) {
    var shippingAddressEntity = context
        .read<CheckOutCubit>()
        .orderEntity
        .shippingAddressEntity;
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colorScheme.tertiaryFixedDim,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.checkOut_shippingAddress.tr(),
                style: AppStyles.textStyle13Bold,
              ),
              Spacer(),
              Icon(Icons.edit_outlined, color: colorScheme.tertiaryContainer),
              const SizedBox(width: 6),
              Text(
                LocaleKeys.checkOut_shippingAddressEditButton.tr(),
                style: AppStyles.textStyle13SemiBold.copyWith(
                  color: colorScheme.tertiaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              Expanded(
                child: Text(
                  maxLines: 2,
                  "${LocaleKeys.checkOutSteps_city.tr()} ${shippingAddressEntity.city}, ${LocaleKeys.checkOutSteps_address.tr()} ${shippingAddressEntity.address}, ${LocaleKeys.checkOutSteps_floorNumber.tr()} ${shippingAddressEntity.addressDetails}",
                  style: AppStyles.textStyle16Regular.copyWith(
                    color: colorScheme.tertiary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
