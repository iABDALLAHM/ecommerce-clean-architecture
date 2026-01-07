import 'package:ecommerce_clean_architecture/features/auth/presentation/functions/build_best_selling_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = "bestSelling";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBestSellingAppBar(context),
      body: BestSellingViewBody(),
    );
  }

}
