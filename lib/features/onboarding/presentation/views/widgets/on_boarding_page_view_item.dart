import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.backgroundImage,
    required this.onBoardingLogo,
    required this.widget,
    required this.subTitle,
    required this.isSecond,
  });
  final String backgroundImage, onBoardingLogo, subTitle;
  final Widget widget;
  final bool isSecond;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
            ),
            Positioned(
              right: 0,
              top: height * 0.23,
              left: 0,
              child: SvgPicture.asset(onBoardingLogo, fit: BoxFit.scaleDown),
            ),
            isSecond == false
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 45,
                      horizontal: 30,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text("تخط", style: AppStyles.textStyle13Regular),
                    ),
                  ),
          ],
        ),
        SizedBox(height: height * 0.18),
        widget,
        const SizedBox(height: 24),
        Text(
          subTitle,
          style: AppStyles.textStyle13SemiBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
