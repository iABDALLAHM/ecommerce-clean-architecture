import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({
    super.key,
    required this.pageController,
    required this.globalKey,
    required this.valueListenable,
  });
  final PageController pageController;
  final GlobalKey<FormState> globalKey;
  final ValueListenable<AutovalidateMode> valueListenable;
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
      AddressSection(formKey: globalKey, valueListenable: valueListenable),
      PaymentSection(),
    ];
  }
}
