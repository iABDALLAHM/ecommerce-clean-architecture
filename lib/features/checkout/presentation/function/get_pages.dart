import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

List<Widget> getPages() {
  return [
    ShippingSection(),
    AddressSection(),
    PaymentSection(),
  ];
}
