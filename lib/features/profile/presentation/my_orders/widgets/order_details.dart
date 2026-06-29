import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("طلب رقم: 1234567#", style: AppStyles.textStyle13Bold),
        Text(
          "تم الطلب :22 مارس ,2024",
          style: AppStyles.textStyle11Regular.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "عدد الطلبات ",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff949D9E),
                    ),
                  ),
                  TextSpan(text: ": 10", style: AppStyles.textStyle13Bold),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Text("250 جنية", style: AppStyles.textStyle13Bold),
          ],
        ),
      ],
    );
  }
}
