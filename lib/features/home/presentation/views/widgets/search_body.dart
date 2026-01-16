import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_seach_text_field.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/search_body_app_bar.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});
  static const String routeName = "SearchBody";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 16),
                SearchBodyAppBar(),
                const SizedBox(height: 16),
                CustomSearchTextField(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
