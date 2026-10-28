import 'dart:developer';

import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/main/main.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/enums/product_filters/products_filters_enum.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/get_filter_products_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterByWidget extends StatefulWidget {
  const FilterByWidget({super.key});

  @override
  State<FilterByWidget> createState() => _FilterByWidgetState();
}

class _FilterByWidgetState extends State<FilterByWidget> {
  final Set<ProductFilters> selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    bool isOrganic = selectedFilters.contains(ProductFilters.organic);

    bool lowerThan100 = selectedFilters.contains(
      ProductFilters.lowerThan100EGP,
    );

    bool highCalories = selectedFilters.contains(ProductFilters.highCalories);

    bool lowCalories = selectedFilters.contains(ProductFilters.lowCalories);

    var colorScheme = Theme.of(context).colorScheme;

    return GetFilterProductsBlocListener(
      child: Container(
        decoration: BoxDecoration(color: colorScheme.surface),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 26),
            Text("Filters: ", style: AppStyles.textStyle19Bold),
            const SizedBox(height: 11),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isOrganic
                    ? colorScheme.tertiary
                    : colorScheme.onSecondary,
              ),
              onPressed: () => toggleFilter(filter: ProductFilters.organic),
              child: Text("Organic Products"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lowerThan100
                    ? colorScheme.tertiary
                    : colorScheme.onSecondary,
              ),
              onPressed: () =>
                  toggleFilter(filter: ProductFilters.lowerThan100EGP),
              child: Text(r"Products LowerThan 100EGP"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lowCalories
                    ? colorScheme.tertiary
                    : colorScheme.onSecondary,
              ),
              onPressed: () => toggleFilter(filter: ProductFilters.lowCalories),
              child: Text(r"Products with low Calories"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: highCalories
                    ? colorScheme.tertiary
                    : colorScheme.onSecondary,
              ),
              onPressed: () =>
                  toggleFilter(filter: ProductFilters.highCalories),
              child: Text(r"Products with high Calories"),
            ),

            const SizedBox(height: 30),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              child: CustomButton(
                text: "Save Filter",
                onPressed: () {
                  log(selectedFilters.toString());
                  context.read<ProductsCubit>().getFilterdProducts(
                    filters: selectedFilters,
                  );
                },
              ),
            ),
            const SizedBox(height: 52),
          ],
        ),
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
