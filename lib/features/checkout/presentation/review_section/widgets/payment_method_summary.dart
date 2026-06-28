import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';

class PaymentMethodSummary extends StatelessWidget {
  const PaymentMethodSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromARGB(56, 158, 158, 158),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("وسيلة الدفع", style: AppStyles.textStyle13Bold),
              Spacer(),
              Icon(Icons.edit_outlined, color: Color(0xff6C7275)),
              const SizedBox(width: 6),
              Text(
                "تعديل",
                style: AppStyles.textStyle13SemiBold.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          Row(
            children: [
              Spacer(),
              Text("**** **** **** 6522"),
              const SizedBox(width: 30),
              Image.asset(Assets.imagesVisa, width: 53, height: 34),
            ],
          ),
        ],
      ),
    );
  }
}
