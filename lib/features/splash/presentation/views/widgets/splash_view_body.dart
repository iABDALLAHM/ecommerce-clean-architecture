import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

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

  Future<void> navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushNamed(OnboardingView.routeName);
    });
  }
}
