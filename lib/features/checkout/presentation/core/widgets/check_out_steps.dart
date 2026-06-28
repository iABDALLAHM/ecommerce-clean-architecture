import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/function/get_header_text_steps_page_view.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_step.dart';
import 'package:flutter/material.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getHeaderTextStepsPageView().length, (index) {
          return CheckOutStep(
            stepIndex: index + 1,
            isSelected: currentPage == index || currentPage > index
                ? true
                : false,
            text: getHeaderTextStepsPageView()[index],
          );
        }),
      ),
    );
  }
}
