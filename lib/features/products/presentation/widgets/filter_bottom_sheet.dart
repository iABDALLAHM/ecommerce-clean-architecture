import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/enums/radio_enum_choices/radio_enum_choices.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/get_filter_products_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/radio_choices.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RadioChoicesEnum? radioChoicesEnumValue = RadioChoicesEnum.alphabetical;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GetFilterProductsBlocListener(
      child: Container(
        decoration: BoxDecoration(color: colorScheme.surface),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Center(
                  child: Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                Text(
                  LocaleKeys.home_sortBy.tr(),
                  style: AppStyles.textStyle19Bold,
                ),
                const SizedBox(height: 11),
                RadioChoices(
                  onChange: (value) {
                    radioChoicesEnumValue = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButton(
                    text: LocaleKeys.home_sort.tr(),
                    onPressed: () {
                      if (radioChoicesEnumValue ==
                          RadioChoicesEnum.fromLowToHigh) {
                        context.read<ProductsCubit>().getLowPriceProducts();
                      } else if (radioChoicesEnumValue ==
                          RadioChoicesEnum.fromHighToLow) {
                        context.read<ProductsCubit>().getHighPriceProducts();
                      } else if (radioChoicesEnumValue ==
                          RadioChoicesEnum.alphabetical) {
                        context.read<ProductsCubit>().getProductsSortedByName();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 52),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
