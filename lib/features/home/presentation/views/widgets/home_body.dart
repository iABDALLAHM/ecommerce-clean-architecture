import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_search_field.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_featured_list.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
                CustomHomeAppBar(),
                const SizedBox(height: 16),
                CustomSearchField(),
                const SizedBox(height: 12),
                CustomFeaturedList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
