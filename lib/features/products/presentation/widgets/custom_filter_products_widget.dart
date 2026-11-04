import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/products/domain/entities/filter_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/enums/product_filters/products_filters_enum.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/custom_filter_option.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/get_filter_products_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFilterProductsWidget extends StatefulWidget {
  const CustomFilterProductsWidget({super.key});

  @override
  State<CustomFilterProductsWidget> createState() =>
      _CustomFilterProductsWidgetState();
}

class _CustomFilterProductsWidgetState
    extends State<CustomFilterProductsWidget> {
  Set<ProductFilters> selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    List<FilterItemEntity> listOfFilters = [
  FilterItemEntity(
    title: LocaleKeys.filters_organicProducts.tr(context: context),
    icon: Icons.eco_outlined,
    filter: ProductFilters.organic,
  ),
  FilterItemEntity(
    title: LocaleKeys.filters_LowCaloriesProducts.tr(context: context),
    icon: Icons.fitness_center,
    filter: ProductFilters.lowCalories,
  ),
  FilterItemEntity(
    title: LocaleKeys.filters_lowerThan100Products.tr(context: context),
    icon: Icons.payments,
    filter: ProductFilters.lowerThan100EGP,
  ),
  FilterItemEntity(
    title: LocaleKeys.filters_highCaloriesProducts.tr(context: context),
    icon: Icons.electric_bolt_outlined,
    filter: ProductFilters.highCalories,
  ),
];

    return GetFilterProductsBlocListener(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.filters_productHighlights.tr(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              selectedFilters.isEmpty
                  ? Text("")
                  : Text(
                      "${selectedFilters.length} ${LocaleKeys.filters_selectedItems.tr()}",
                      style: TextStyle(color: Color(0xff14532D)),
                    ),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            child: GridView.builder(
              itemCount: listOfFilters.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3.2,
              ),
              itemBuilder: (context, index) {
                var item = listOfFilters[index];
                var selected = selectedFilters.contains(item.filter);

                return CustomFilterOption(
                  icon: item.icon,
                  isSelected: selected,
                  title: item.title,
                  onTap: () => toggleFilter(filter: item.filter),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Divider(endIndent: 7, indent: 7, color: Color(0xffE2E8F0)),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: BorderSide(width: 1, color: Color(0xffE2E8F0)),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xff475569),
                  ),
                  onPressed: () {
                    selectedFilters = {};
                    setState(() {});
                  },
                  child: Text(
                    "${LocaleKeys.filters_resetButton.tr()}${selectedFilters.isEmpty?"":"(${(selectedFilters.length)})"}",
                    style: AppStyles.textStyle13SemiBold,
                  ),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButton(
                    text:
                        "${LocaleKeys.filters_applyFilters.tr()} ${(selectedFilters.isEmpty ? "" : "(${selectedFilters.length} ${LocaleKeys.filters_items.tr()})")}",
                    onPressed: () {
                      context.read<ProductsCubit>().getFilterdProducts(
                        filters: selectedFilters,
                      );
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

  void toggleFilter({required ProductFilters filter}) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      if (filter == ProductFilters.lowCalories) {
        selectedFilters.remove(ProductFilters.highCalories);
      } else if (filter == ProductFilters.highCalories) {
        selectedFilters.remove(ProductFilters.lowCalories);
      }
      selectedFilters.add(filter);
    }
    setState(() {});
  }
}
