import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/custom_filter_products_widget.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/custom_sort_by_widget.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int currentWidget = 1;
  int selectedSection = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 50,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xffCBD5E1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    selectedSection == 0
                        ? Text(
                            LocaleKeys.filters_PREFERENCES.tr(),
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff14532D),
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        : Text(
                            LocaleKeys.filters_REFINE_SEARCH.tr(),
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff14532D),
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                    const SizedBox(height: 5),
                    selectedSection == 0
                        ? Text(
                            LocaleKeys.filters_sortBy.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            LocaleKeys.filters_filterProducts.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F5F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.close, color: colorScheme.onSecondary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            Divider(endIndent: 7, indent: 7, color: Color(0xffE2E8F0)),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                color: Color(0xffF1F5F9),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectedSection = 0;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedSection == 0
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.swap_vert_rounded,
                                color: selectedSection == 0
                                    ? Color(0xFF14532D)
                                    : Color(0xff475569),
                                size: 22,
                              ),
                              SizedBox(width: 8),
                              Text(
                                LocaleKeys.filters_sortBy.tr(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: selectedSection == 0
                                      ? Color(0xFF14532D)
                                      : Color(0xff475569),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectedSection = 1;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedSection == 1
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.tune_rounded,
                                color: selectedSection == 1
                                    ? Color(0xFF14532D)
                                    : Color(0xff475569),
                                size: 22,
                              ),
                              SizedBox(width: 8),
                              Text(
                                LocaleKeys.filters_filterBy.tr(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: selectedSection == 1
                                      ? Color(0xFF14532D)
                                      : Color(0xff475569),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            if (selectedSection == 0) CustomSortByWidget(),
            if (selectedSection == 1) CustomFilterProductsWidget(),
          ],
        ),
      ),
    );
  }
}
