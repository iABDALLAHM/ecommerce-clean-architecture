import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/main_view.dart';
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
    navigateToNextScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesOnBoardingGrassLogo)],
        ),
        SvgPicture.asset(Assets.imagesOnBoardingLogo),
        SvgPicture.asset(Assets.imagesOnBoardingFooterLogo, fit: BoxFit.cover),
      ],
    );
  }

  Future<void> navigateToNextScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      handleIfOnBoardingSeen(context);
    });
  }

  void handleIfOnBoardingSeen(BuildContext context) {
    var onBoardingSeen = SharedPrefsService.getBool(key: kOnBoardingSeen);
    if (onBoardingSeen) {
      handleIfUserLoggedIn(context);
    } else {
      Navigator.of(context).pushNamed(OnboardingView.routeName);
    }
  }

  var isUserLoggedIn = SharedPrefsService.getBool(key: kIsUserSignIn);
  void handleIfUserLoggedIn(BuildContext context) {
    if (isUserLoggedIn) {
      Navigator.of(context).pushReplacementNamed(MainView.routeName);
    } else {
      Navigator.of(context).pushNamed(LoginView.routeName);
    }
  }
}
