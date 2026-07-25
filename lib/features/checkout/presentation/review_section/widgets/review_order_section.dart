import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/add_order_cubit/add_order_states.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/add_order_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/address_summary.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/order_summary.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_section/widgets/payment_method_summary.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewOrderSection extends StatelessWidget {
  const ReviewOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrderBlocListener(
      child: BlocBuilder<AddOrderCubit, AddOrderStates>(
        builder: (context, state) {
          return CustomProgressWidget(
            state: state is LoadingAddOrderState ? true : false,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    OrderSummary(),
                    const SizedBox(height: 16),
                    Text(LocaleKeys.checkOut_confirmationOrder.tr(), style: AppStyles.textStyle13Bold),
                    const SizedBox(height: 8),
                    PaymentMethodSummary(),
                    const SizedBox(height: 8),
                    AddressSummary(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
