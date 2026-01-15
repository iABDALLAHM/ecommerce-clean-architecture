import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ReviewsSummarySection extends StatelessWidget {
  const ReviewsSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("الملخص", style: AppStyles.textStyle16SemiBold),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 8),
                    Text("4.5", style: AppStyles.textStyle13Bold),
                  ],
                ),
                const SizedBox(height: 22),
                Text("88%", style: AppStyles.textStyle16Regular),
                const SizedBox(height: 22),
                Text("موصي بها", style: AppStyles.textStyle13Regular),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
