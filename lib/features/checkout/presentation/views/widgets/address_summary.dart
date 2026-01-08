import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AddressSummary extends StatelessWidget {
  const AddressSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromARGB(56, 158, 158, 158),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("عنوان التوصيل", style: AppStyles.textStyle13Bold),
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
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text(
                "شارع النيل، مبنى رقم ١٢٣",
                style: AppStyles.textStyle16Regular.copyWith(
                  color: Color(0xff4E5556),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}