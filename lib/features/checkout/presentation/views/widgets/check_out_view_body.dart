import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/change_button_text.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_steps.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key, required this.onChange});
  final ValueChanged<int> onChange;

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  late PageController pageController;
  int currentPage = 0;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CheckOutSteps(currentPage: currentPage, pageController: pageController),
        Expanded(
          child: CheckOutPageView(
            valueListenable: valueNotifier,
            pageController: pageController,
            globalKey: formKey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: CustomButton(
              text: changeButtonText(currentPage: currentPage),
              onPressed: () {
                if (currentPage == 0) {
                  _handleShippingSectionValidation(context);
                } else if (currentPage == 1) {
                  _handleAddressSection(context);
                } else if (currentPage == 2) {
                  _handlePaymentSection(context);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showSnackBar(context, message: "من فضلك اختر طريقة الدفع");
    }
  }

  void _handleAddressSection(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
      setState(() {});
    }
  }

  void _handlePaymentSection(BuildContext context) {




  }
}
