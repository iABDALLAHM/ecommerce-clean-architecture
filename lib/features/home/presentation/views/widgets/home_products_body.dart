import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeProductsBody extends StatelessWidget {
  const HomeProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 16 * 2),
              CustomHomeAppBar(),
            ],
          ),
        ),
      ],
    );
  }
}
