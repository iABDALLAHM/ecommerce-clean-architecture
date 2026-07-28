import 'package:flutter/material.dart';

class ReviewLineIndicator extends StatelessWidget {
  const ReviewLineIndicator({super.key, required this.percentage});
  final double percentage;
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.sizeOf(context).width;
    var colorScheme = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 8,
          width: width,
          decoration: BoxDecoration(
            color: colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Container(
          height: 8,
          width: width * percentage,
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
