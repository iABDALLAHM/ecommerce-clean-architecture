import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: getPages().length,
      itemBuilder: (context, index) => getPages()[index],
    );
  }

  List<Widget> getPages() {
    return [ShippingSection(), AddressSection(), PaymentSection()];
  }
}
