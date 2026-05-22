import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/manager/onboarding_cubit/onboarding_state.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/custom_indicator.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        CustomIndicator(currentPage: currentPage),
        const SizedBox(height: 29),
        currentPage == 1
            ? SizedBox(
                width: double.infinity,
                height: 54,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: Visibility(
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    child: BlocListener<OnboardingCubit, OnboardingState>(
                      listener: (context, state) {
                        if (state is SuccessSkipOnBoarding) {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(LoginView.routeName);
                        }
                      },
                      child: CustomButton(
                        text: "ابدأ الان",
                        onPressed: () {
                          context
                              .read<OnboardingCubit>()
                              .handleSkipOnboarding();
                        },
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(width: double.infinity, height: 54),
        const SizedBox(height: 43),
      ],
    );
  }
}
