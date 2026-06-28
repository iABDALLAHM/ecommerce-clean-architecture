import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/widgets/choose_payment_card_option.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/widgets/make_card_as_default.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          Text(
            "أختار طريقه الدفع المناسبه :",
            style: AppStyles.textStyle13Bold,
          ),
          const SizedBox(height: 13),
          Text(
            "من فضلك اختر طريقه الدفع المناسبه لك.",
            style: AppStyles.textStyle13Regular,
          ),

          const SizedBox(height: 13),

          Row(
            children: [
              ChoosePaymentCardOption(image: Assets.imagesApplePay),
              const SizedBox(width: 16),
              ChoosePaymentCardOption(image: Assets.imagesPayPal),
              const SizedBox(width: 16),

              ChoosePaymentCardOption(image: Assets.imagesMasterCard),
              const SizedBox(width: 16),

              ChoosePaymentCardOption(image: Assets.imagesVisa),
            ],
          ),

          const SizedBox(height: 16),

          CustomTextFormField(
            hintText: "اسم حامل البطاقه",
            onSaved: (value) {},
          ),

          const SizedBox(height: 8),

          CustomTextFormField(hintText: "رقم البطاقة", onSaved: (value) {}),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "تاريخ الصلاحيه",
                  onSaved: (value) {},
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  hintText: "CVV",
                  onSaved: (value) {},
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          MakeCardAsDefault(isSelected: (value) {}),
        ],
      ),
    );
  }
}
