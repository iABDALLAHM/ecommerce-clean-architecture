import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';

class SaleAndShippingSection extends StatelessWidget {
  const SaleAndShippingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text(
          "عروض العيد",
          style: AppStyles.textStyle13Regular.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Spacer(),
        Text(
          "خصم 25%",
          style: AppStyles.textStyle19Bold.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 25),
        FeaturedItemButton(),
        const SizedBox(height: 25),
      ],
    );
  }
}
