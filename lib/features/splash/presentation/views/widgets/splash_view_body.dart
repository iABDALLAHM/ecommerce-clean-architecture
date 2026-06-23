import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/cubits/splash_cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
          context.go(AppRoutes.onboarding);
        } else if (state is NavigateToLoginScreenState) {
          context.go(AppRoutes.login);
        } else if (state is NavigateToMainScreenState) {
          context.go(AppRoutes.home);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [SvgPicture.asset(Assets.imagesSplashGrassLogo)],
          ),
          SvgPicture.asset(Assets.imagesSplashLogo),
          SvgPicture.asset(Assets.imagesSplashFooterLogo, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
