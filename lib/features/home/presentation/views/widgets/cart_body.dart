import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_header.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_item.dart';
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
              CartItem(),
              const SizedBox(height: 24),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: CustomButton(text: "الدفع  120جنيه", onPressed: () {}),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
