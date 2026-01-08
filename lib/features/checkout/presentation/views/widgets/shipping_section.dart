import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/shipping_options.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [const SizedBox(height: 32), ShippingOptions()]),
    );
  }
}
