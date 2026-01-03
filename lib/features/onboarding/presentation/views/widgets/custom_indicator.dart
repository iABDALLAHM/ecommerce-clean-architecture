import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/custom_dot.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.only(left: 10), child: CustomDot()),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CustomDot(color: AppColors.lightPrimaryColor),
        ),
      ],
    );
  }
}
