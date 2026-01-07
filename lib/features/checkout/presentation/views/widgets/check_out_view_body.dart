import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_steps.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_page_view.dart';
import 'package:flutter/material.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CheckOutSteps(),
        Expanded(child: CheckOutPageView()),
      ],
    );
  }
}
