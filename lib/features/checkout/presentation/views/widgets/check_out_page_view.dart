import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/get_pages.dart';
import 'package:flutter/material.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: getPages().length,
      itemBuilder: (context, index) => getPages()[index],
    );
  }
}
