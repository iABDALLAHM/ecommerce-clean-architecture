import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("الأكثر مبيعًا", style: AppStyles.textStyle16Bold),
        GestureDetector(
          onTap: () {
            context.go("${AppRoutes.home}${AppRoutes.bestSelling}");
          },
          child: Text(
            "المزيد",
            style: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
