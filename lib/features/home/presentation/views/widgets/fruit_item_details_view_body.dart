
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FruitItemDetailsViewBody extends StatelessWidget {
  const FruitItemDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          SvgPicture.asset(Assets.imagesItemDetailsbackground)
        ],
      )
    ],);
  }
}
