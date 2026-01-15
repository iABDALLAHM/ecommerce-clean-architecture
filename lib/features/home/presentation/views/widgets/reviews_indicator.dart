import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/review_line_indicator.dart';
import 'package:flutter/material.dart';

class ReviewsIndicator extends StatelessWidget {
  const ReviewsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: ReviewLineIndicator(percentage: 1)),
            const SizedBox(width: 7),
            Text("5"),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(child: ReviewLineIndicator(percentage: .6)),
            const SizedBox(width: 7),
            Text("4"),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(child: ReviewLineIndicator(percentage: .1)),
            const SizedBox(width: 7),
            Text("3"),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(child: ReviewLineIndicator(percentage: .5)),
            const SizedBox(width: 7),
            Text("2"),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(child: ReviewLineIndicator(percentage: .3)),
            const SizedBox(width: 7),
            Text("1"),
          ],
        ),
      ],
    );
  }
}
