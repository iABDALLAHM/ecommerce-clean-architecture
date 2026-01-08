import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/build_checkout_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});
  static const String routeName = "checkout";

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCheckOutAppBar(context, currentStep: currentStep),
      body: CheckOutViewBody(
        onChange: (value) {
          currentStep = value;
          setState(() {});
        },
      ),
    );
  }
}
