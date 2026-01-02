import 'package:ecommerce_clean_architecture/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(Assets.imagesOnBoardingGrassLogo)],
        ),
        SvgPicture.asset(Assets.imagesOnBoardingLogo),
        SvgPicture.asset(Assets.imagesOnBoardingFooterLogo, fit: BoxFit.cover),
      ],
    );
  }
}
