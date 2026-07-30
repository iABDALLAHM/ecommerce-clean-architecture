import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/cubits/address_validation_cubit/address_validation_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/save_address_cubit/save_address_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/save_payment_details_cubit/save_payment_details_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/function/change_button_text.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_steps.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_page_view.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/cubits/payment_validation_cubit/payment_validation_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
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
      showSnackBar(
        context,
        message: LocaleKeys.checkOutSteps_pleaseSpecifyPaymentMethod.tr(),
      );
    }
  }

  void _handleAddressSection(BuildContext context) {
    var addressValidationCubit = context
        .read<AddressValidationCubit>()
        .vaildate();
    ShippingAddressEntity addressEntity = context
        .read<CheckOutCubit>()
        .orderEntity
        .shippingAddressEntity;
    if (addressValidationCubit) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    if (addressEntity.saveLocation) {
      // save address in database if that is a checked true!
      context.read<SaveAddressCubit>().saveAddress(
        addressEntity: addressEntity,
      );
    }
  }

  void _handlePaymentSection(BuildContext context) {
    var paymentValidationCubit = context
        .read<PaymentValidationCubit>()
        .validate();

    CardEntity cardEntity = context
        .read<CheckOutCubit>()
        .orderEntity
        .cardEntity;

    if (paymentValidationCubit) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    if (cardEntity.markAsDefault) {
      context.read<SavePaymentDetailsCubit>().savePaymentDetails(
        cardEntity: cardEntity,
      );
    }
  }

  void _triggerAddOrderCubit(BuildContext context) {
    OrderEntity orderEntity = context.read<CheckOutCubit>().orderEntity;
    if (orderEntity.uId.isEmpty ||
        orderEntity.shippingAddressEntity.name == null ||
        orderEntity.payWithCash == null) {
      showSnackBar(
        context,
        message: LocaleKeys.checkOutSteps_completeTheInformation.tr(),
      );
    } else {
      context.read<AddOrderCubit>().addOrder(orderEntity: orderEntity);
    }
  }
}

