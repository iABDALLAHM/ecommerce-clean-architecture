import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomReviewerImage extends StatelessWidget {
  const CustomReviewerImage({
    super.key,
    required this.reviewerImageUrl,
    required this.reviewerRating,
  });

  final String reviewerImageUrl;
  final double reviewerRating;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: ClipOval(
            child: Image.network(
              fit: BoxFit.cover,
              width: 50,
              height: 50,
              reviewerImageUrl,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.person);
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -10,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${reviewerRating.toDouble()}",
              style: AppStyles.textStyle11SemiBold.copyWith(
                color: colorScheme.surface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
