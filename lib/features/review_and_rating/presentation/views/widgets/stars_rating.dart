import 'package:flutter/material.dart';

class StarsRating extends StatefulWidget {
  final ValueChanged<int> onRatingChanged;

  const StarsRating({super.key, required this.onRatingChanged});

  @override
  State<StarsRating> createState() => _StarsRatingState();
}

class _StarsRatingState extends State<StarsRating> {
  int rating = 0; // الرقم الي انا مختاره

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        int starValue = index + 1;
        return GestureDetector(
          onTap: () {
            setState(() {
              rating = starValue;
            });
            widget.onRatingChanged(rating);
          },
          child: Icon(
            starValue <= rating ? Icons.star : Icons.star_outline,
            color: starValue <= rating ? Colors.amber : Colors.grey,
            size: 35,
          ),
        );
      }),
    );
  }
}
