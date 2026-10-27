import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/filter_by_widget.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/sort_by_widget.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int currentWidget = -1;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentWidget == 1
                          ? colorScheme.secondary
                          : colorScheme.primary,
                    ),
                    child: Text("Sort By:"),
                    onPressed: () {
                      currentWidget = 1;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentWidget == 2
                          ? colorScheme.secondary
                          : colorScheme.primary,
                    ),

                    child: Text("Filter By:"),
                    onPressed: () {
                      currentWidget = 2;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            if (currentWidget == 1) Expanded(flex: 2, child: SortByWidget()),

            if (currentWidget == 2) Expanded(flex: 2, child: FilterByWidget()),
          ],
        ),
      ),
    );
  }
}
