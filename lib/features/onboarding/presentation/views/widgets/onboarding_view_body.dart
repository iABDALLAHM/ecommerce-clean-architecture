import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/custom_indicator.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
        CustomIndicator(),
        const SizedBox(height: 29),
        SizedBox(
          width: double.infinity,
          height: 54,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(text: "ابدأ الان", onPressed: () {}),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}




