import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/get_text_steps.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_step.dart';
import 'package:flutter/material.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({
    super.key,
    required this.currentPage,
    required this.pageController,
  });
  final PageController pageController;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getTextSteps().length, (index) {
          return GestureDetector(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: CheckOutStep(
              stepIndex: index + 1,
              isSelected: currentPage == index || currentPage > index
                  ? true
                  : false,
              text: getTextSteps()[index],
            ),
          );
        }),
      ),
    );
  }
}
