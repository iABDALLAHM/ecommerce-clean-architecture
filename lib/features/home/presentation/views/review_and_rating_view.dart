import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/review_and_rating_view_body.dart';
import 'package:flutter/material.dart';

class ReviewAndRatingView extends StatelessWidget {
  const ReviewAndRatingView({super.key});
  static const String routeName = "ReviewAndRatingView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildReviewAndRatingAppBar(),
      body: ReviewAndRatingViewBody(),
    );
  }

  AppBar buildReviewAndRatingAppBar() {
    return AppBar(
      centerTitle: true,
      leading: Icon(Icons.arrow_back_ios_new),
      title: Text("المراجعه", style: AppStyles.textStyle19Bold),
    );
  }
}
