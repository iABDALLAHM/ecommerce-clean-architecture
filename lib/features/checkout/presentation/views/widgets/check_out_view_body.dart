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
    return Column(
      children: [
        const SizedBox(height: 16),
        CheckOutSteps(currentPage: currentPage, pageController: pageController),
        Expanded(child: CheckOutPageView(pageController: pageController)),
      ],
    );
  }
}
