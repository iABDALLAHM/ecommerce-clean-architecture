import 'package:flutter/material.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [const SizedBox(height: 32), Text("ShippingSection")],
      ),
    );
  }
}
