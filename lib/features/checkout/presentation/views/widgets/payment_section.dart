import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/address_summary.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            OrderSummary(),
            const SizedBox(height: 16),
            AddressSummary(),
          ],
        ),
      ),
    );
  }
}
