import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/review_order_view_body.dart';
import 'package:flutter/material.dart';

class ReviewOrderView extends StatelessWidget {
  const ReviewOrderView({super.key});
  static const String routeName = "ReviewOrderView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("الدفع", style: AppStyles.textStyle19Bold),
        centerTitle: true,
      ),
      body: ReviewOrderViewBody(),
    );
  }
}
