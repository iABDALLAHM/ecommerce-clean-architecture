import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/reviews_indicator.dart';
import 'package:flutter/material.dart';

class ReviewsSummarySection extends StatelessWidget {
  const ReviewsSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("الملخص", style: AppStyles.textStyle16SemiBold),
        const SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(width: 22),
              Expanded(child: ReviewsIndicator()),
            ],
          ),
        ),
      ],
    );
  }
}
