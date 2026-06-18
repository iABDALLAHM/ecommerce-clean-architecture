import 'package:flutter/material.dart';

class ReviewLineIndicator extends StatelessWidget {
  const ReviewLineIndicator({super.key, required this.percentage});
  final double percentage;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 8,
          width: width,
          decoration: BoxDecoration(
            color: Color(0xffE6E7E7),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Container(
          height: 8,
          width: width * percentage,
          decoration: BoxDecoration(
            color: Color(0xffFFB400),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
