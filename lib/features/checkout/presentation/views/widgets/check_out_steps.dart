import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_step.dart';
import 'package:flutter/material.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          getSteps().length,
          (index) =>
              CheckOutStep(isSelected: true, text: getSteps()[index]),
        ),
      ),
    );
  }

  List<String> getSteps() {
    return ["الشحن", "العنوان", "الدفع"];
  }
}
