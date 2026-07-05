import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/cubits/address_validation_cubit/address_validation_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/function/change_button_text.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_steps.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      setState(() {
        currentPage = pageController.page!.round();
      });
      widget.onChange(currentPage);
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),

        CheckOutSteps(currentPage: currentPage),

        Expanded(child: CheckOutPageView(pageController: pageController)),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: CustomButton(
              text: changeButtonText(currentPage: currentPage),
              onPressed: () {
                if (currentPage == 0) {
                  _handleShippingSectionValidation(context: context);
                } else if (currentPage == 1) {
                  _handleAddressSection(context);
                } else if (currentPage == 2) {
                  _handlePaymentSection(context);
                } else if (currentPage == 3) {
                  _triggerAddOrderCubit(context);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  void _handleShippingSectionValidation({required BuildContext context}) {
    var payWithValue = context.read<CheckOutCubit>().orderEntity.payWithCash;
    if (payWithValue != null) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showSnackBar(context, message: "حدد وسيلة الدفع من فضلك");
    }
  }

  void _handleAddressSection(BuildContext context) {
    var addressValidationCubit = context
        .read<AddressValidationCubit>()
        .vaildate();
    if (addressValidationCubit) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _handlePaymentSection(BuildContext context) {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _triggerAddOrderCubit(BuildContext context) {
    OrderEntity orderEntity = context.read<CheckOutCubit>().orderEntity;
    if (orderEntity.uId.isEmpty ||
        orderEntity.shippingAddressEntity.name == null ||
        orderEntity.payWithCash == null) {
      showSnackBar(context, message: "اكمل البيانات من فضلك");
    } else {
      context.read<AddOrderCubit>().addOrder(orderEntity: orderEntity);
    }
  }
}
