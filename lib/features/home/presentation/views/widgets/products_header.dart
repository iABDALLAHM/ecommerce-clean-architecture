import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productsLength});
  final num productsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$productsLength نتائج"),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(115, 158, 158, 158),
            ),
          ),
          child: SvgPicture.asset(Assets.imagesArrowSwapHorizontal),
        ),
      ],
    );
  }
}
