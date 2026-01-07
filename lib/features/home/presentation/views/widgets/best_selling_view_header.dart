import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BestSellingViewHeader extends StatelessWidget {
  const BestSellingViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text("الأكثر مبيعًا", style: AppStyles.textStyle16Bold)],
    );
  }
}
