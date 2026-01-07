
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomItemImage extends StatelessWidget {
  const CustomItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 26, horizontal: 10),
      decoration: BoxDecoration(color: Color(0xffF3F5F7)),
      child: Center(
        child: Image.asset(
          Assets.imagesWatermelonForTest,
          width: 53,
          height: 40,
        ),
      ),
    );
  }
}