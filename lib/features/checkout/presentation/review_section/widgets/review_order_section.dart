import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/address_summary.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/order_summary.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/payment_method_summary.dart';
import 'package:flutter/material.dart';

class ReviewOrderSection extends StatelessWidget {
  const ReviewOrderSection({super.key});

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
            Text("يرجي تأكيد  طلبك", style: AppStyles.textStyle13Bold),
            const SizedBox(height: 8),
            PaymentMethodSummary(),
            const SizedBox(height: 8),
            AddressSummary(),
          ],
        ),
      ),
    );
  }
}
