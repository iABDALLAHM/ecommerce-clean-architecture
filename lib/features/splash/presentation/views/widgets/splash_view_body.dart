import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/main_view.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/manager/splash_cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    context.read<SplashCubit>().checkUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is NavigateToOnboardingScreenState) {
          Navigator.of(context).pushNamed(OnboardingView.routeName);
        } else if (state is NavigateToLoginScreenState) {
          Navigator.of(context).pushNamed(LoginView.routeName);
        } else if (state is NavigateToMainScreenState) {
          Navigator.of(context).pushReplacementNamed(MainView.routeName);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [SvgPicture.asset(Assets.imagesOnBoardingGrassLogo)],
          ),
          SvgPicture.asset(Assets.imagesOnBoardingLogo),
          SvgPicture.asset(
            Assets.imagesOnBoardingFooterLogo,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
