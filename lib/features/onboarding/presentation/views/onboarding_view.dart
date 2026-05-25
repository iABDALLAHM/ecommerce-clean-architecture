import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/on_boarding_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String routeName = "Onboarding";
  @override
  Widget build(BuildContext context) {
    return OnboardingBlocProvider(child: Scaffold(body: OnboardingViewBody()));
  }
}
