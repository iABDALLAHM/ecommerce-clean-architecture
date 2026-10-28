import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/filter_by_widget.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/sort_by_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int currentWidget = 1;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.close, color: colorScheme.onSecondary),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: currentWidget == 1
                            ? colorScheme.secondary
                            : colorScheme.primaryFixed,
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
                        padding: EdgeInsets.zero,
                        backgroundColor: currentWidget == 2
                            ? colorScheme.secondary
                            : colorScheme.primaryFixed,
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
              SizedBox(
                height: height * .5,
                child: VerticalDivider(color: colorScheme.primary),
              ),

              if (currentWidget == 1) Expanded(flex: 4, child: SortByWidget()),

              if (currentWidget == 2)
                Expanded(flex: 4, child: FilterByWidget()),
            ],
          ),
        ],
      ),
    );
  }
}
