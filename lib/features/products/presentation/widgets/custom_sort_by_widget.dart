import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/enums/radio_enum_choices/radio_enum_choices.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/custom_sort_option.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/get_filter_products_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSortByWidget extends StatefulWidget {
  const CustomSortByWidget({super.key});

  @override
  State<CustomSortByWidget> createState() => _CustomSortByWidgetState();
}

class _CustomSortByWidgetState extends State<CustomSortByWidget> {
  RadioChoicesEnum? radioChoicesEnumValue;

  @override
  Widget build(BuildContext context) {
    return GetFilterProductsBlocListener(
      child: Column(
        children: [
          CustomSortOption(
            title: "Price (Low to High)",
            subTitle: "Budget & best value first",
            isSelected: radioChoicesEnumValue == RadioChoicesEnum.fromLowToHigh
                ? true
                : false,
            icon: Icons.moving,
            onTap: () {
              radioChoicesEnumValue = RadioChoicesEnum.fromLowToHigh;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),

          CustomSortOption(
            icon: Icons.trending_down,
            title: "Price (High to Low)",
            subTitle: "Premium & bulk packs first",
            isSelected: radioChoicesEnumValue == RadioChoicesEnum.fromHighToLow
                ? true
                : false,
            onTap: () {
              radioChoicesEnumValue = RadioChoicesEnum.fromHighToLow;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),

          CustomSortOption(
            icon: Icons.sort_by_alpha,

            title: "Alphabetical",
            subTitle: "Order alphabetically A to Z",
            isSelected: radioChoicesEnumValue == RadioChoicesEnum.alphabetical
                ? true
                : false,
            onTap: () {
              radioChoicesEnumValue = RadioChoicesEnum.alphabetical;
              setState(() {});
            },
          ),
          const SizedBox(height: 8),
          Divider(endIndent: 7, indent: 7, color: Color(0xffE2E8F0)),
          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: BorderSide(width: 1, color: Color(0xffE2E8F0)),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xff475569),
                  ),
                  onPressed: () {
                    radioChoicesEnumValue = null;
                    setState(() {});
                  },
                  child: Text("Reset ", style: AppStyles.textStyle13SemiBold),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButton(
                    text: "Apply Sorting",
                    onPressed: () {
                      if (radioChoicesEnumValue ==
                          RadioChoicesEnum.fromLowToHigh) {
                        context.read<ProductsCubit>().getLowPriceProducts();
                      } else if (radioChoicesEnumValue ==
                          RadioChoicesEnum.fromHighToLow) {
                        context.read<ProductsCubit>().getHighPriceProducts();
                      } else if (radioChoicesEnumValue ==
                          RadioChoicesEnum.alphabetical) {
                        context.read<ProductsCubit>().getProductsSortedByName(
                          languageCode: context.locale.languageCode,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
