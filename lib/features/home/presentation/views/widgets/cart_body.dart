import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_header.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 16),
              CartAppBar(),
              const SizedBox(height: 16),
              CartHeader(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
