import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/get_text_steps.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getTextSteps().length, (index) {
          return GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  currentPage,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                showSnackBar(context, message: "من فضلك اختر طريقة الدفع");
              }
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
