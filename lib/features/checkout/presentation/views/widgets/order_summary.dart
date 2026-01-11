import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ملخص الطلب :", style: AppStyles.textStyle13Bold),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color.fromARGB(56, 158, 158, 158),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المجموع الفرعي :",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff4E5556),
                      ),
                    ),
                    Text(
                      "${context.read<OrderEntity>().cartEntity.calculateTotalPrice().round()} جنيه",
                      style: AppStyles.textStyle16SemiBold,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("التوصيل  :", style: AppStyles.textStyle13Regular),
                  Text(
                    "40 جنية",
                    style: AppStyles.textStyle13SemiBold.copyWith(
                      color: Color(0xff4E5556),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Divider(endIndent: 34, indent: 34),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("الكلي", style: AppStyles.textStyle16Bold),
                  Text(
                    "${context.read<OrderEntity>().cartEntity.calculateTotalPrice().round() + 40} جنيه",
                    style: AppStyles.textStyle16Bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
