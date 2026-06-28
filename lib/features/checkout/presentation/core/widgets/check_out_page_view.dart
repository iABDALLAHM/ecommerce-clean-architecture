import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/widgets/address_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/widgets/payment_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/review_order_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/shipping_options_section/widgets/shipping_section.dart';
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

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressSection(),
      PaymentSection(),
      ReviewOrderSection(),
    ];
  }
}
