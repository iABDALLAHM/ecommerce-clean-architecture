import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileBodyAppBar extends StatelessWidget {
  const ProfileBodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("حسابي", style: AppStyles.textStyle19Bold)],
    );
  }
}
