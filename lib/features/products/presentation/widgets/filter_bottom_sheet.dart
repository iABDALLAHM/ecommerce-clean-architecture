import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/cubits/get_filter_products_cubit/get_filter_products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/enums/radio_enum_choices/radio_enum_choices.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/radio_choices.dart';
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
    return Container(
      decoration: BoxDecoration(color: Colors.white),
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
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Text("ترتيب حسب :", style: AppStyles.textStyle19Bold),
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
                  text: "تصفيه",
                  onPressed: () {
                    if (radioChoicesEnumValue ==
                        RadioChoicesEnum.fromLowToHigh) {
                      context
                          .read<GetFilterProductsCubit>()
                          .getLowPriceProducts();
                    } else if (radioChoicesEnumValue ==
                        RadioChoicesEnum.fromHighToLow) {
                      context
                          .read<GetFilterProductsCubit>()
                          .getHighPriceProducts();
                    } else if (radioChoicesEnumValue ==
                        RadioChoicesEnum.alphabetical) {
                      context
                          .read<GetFilterProductsCubit>()
                          .getProductsSortedByName();
                    }
                  },
                ),
              ),
              const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }
}
