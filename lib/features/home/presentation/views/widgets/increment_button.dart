
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: OvalBorder(),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


