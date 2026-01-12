import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItemIcon extends StatelessWidget {
  const OrderItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffEBF9F1),
      ),
      child: SvgPicture.asset(Assets.imagesBoxIcon),
    );
  }
}
