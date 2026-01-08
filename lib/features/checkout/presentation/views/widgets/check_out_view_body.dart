import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/change_button_text.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_steps.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_page_view.dart';
import 'package:flutter/material.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key, required this.onChange});
  final ValueChanged<int> onChange;

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
      widget.onChange(currentPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CheckOutSteps(
            currentPage: currentPage,
            pageController: pageController,
          ),
          Expanded(child: CheckOutPageView(pageController: pageController)),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: CustomButton(
              text: changeButtonText(currentPage: currentPage),
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
          SizedBox(height: height * 0.4),
        ],
      ),
    );
  }
}
