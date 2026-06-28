import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/shipping_options_section/widgets/shipping_options.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [const SizedBox(height: 32), ShippingOptions()],
        ),
      ),
    );
  }
}
