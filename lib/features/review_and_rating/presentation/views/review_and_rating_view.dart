import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/review_and_rating_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReviewAndRatingView extends StatelessWidget {
  const ReviewAndRatingView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildReviewAndRatingAppBar(context),
      body: ReviewAndRatingViewBody(productEntity: productEntity),
    );
  }

  AppBar buildReviewAndRatingAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text("المراجعه", style: AppStyles.textStyle19Bold),
    );
  }
}
